Spree::Order.class_eval do

  include Spree::TransactionRegistrable

  has_many :transactions, as: :commissionable, class_name: 'Spree::CommissionTransaction', dependent: :restrict_with_error
  state_machine.after_transition to: :complete, do: :create_commission_transaction

  # state_machine.after_transition to: :complete, do: :create_commission_transaction
  #

  # alias_method_chain :finalize!, :create_commission_transaction
  # state_machine do
  #   after_transition :to => :complete, :do => :create_commission_transaction
  # end
  MINIMUM_ORDER_VALUE = (500).to_i
  def checkout_allowed?
    return :not_empty     unless line_items.count > 0
    return :minimum_value unless total >= MINIMUM_ORDER_VALUE
    true
  end

  private
    def create_commission_transaction
      # register_commission_transaction(affiliate) if affiliate.present?
      # binding.pry
      if user.referred_record != nil
        referred = Spree::Referral.where('lower(code) = ?', user.referred_record.referral.code.downcase).first
        # binding.pry
        store_credit = create_store_credits(referred.user) if referrer_eligible?(referred.user)
      end
      return true
    end

    def create_store_credits(referrer)
      referrer.store_credits.create(amount: referral_amount(referrer),
                                    category_id: referral_store_credit_category.try(:id),
                                    created_by: Spree::User.admin.try(:first),
                                    currency: Spree::Config.currency)
    end

    def referral_store_credit_category
      @store_credit_category ||= Spree::StoreCreditCategory.find_or_create_by(name: Spree::StoreCredit::REFERRAL_STORE_CREDIT_CATEGORY)
    end

    def referral_amount(referrer)
      referrer.referral_credits || Spree::Config[:referral_credits]
    end

    def referrer_eligible?(user)
      Spree::Config[:referrer_benefit_enabled] && user.referrer_benefit_enabled
    end

end

# Validate on state change
#
# Spree::Order.state_machine.after_transition :to => :complete, :do => :create_commission_transaction

# Add terms_and_conditions to strong parameters
# Spree::PermittedAttributes.checkout_attributes << :terms_and_conditions # Remove if Spree is below version 2.1
# Spree::PermittedAttributes.checkout_attributes << :terms_and_conditions unless Spree::PermittedAttributes.checkout_attributes.include?(:terms_and_conditions)

# Spree::Order.class_eval do
#   MINIMUM_ORDER_VALUE = (500).to_i
#   def checkout_allowed?
#     return :not_empty     unless line_items.count > 0
#     return :minimum_value unless total >= MINIMUM_ORDER_VALUE
#     true
#   end
# end
