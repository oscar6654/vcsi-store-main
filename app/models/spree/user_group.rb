class Spree::UserGroup < ActiveRecord::Base
  has_many :users, :dependent => :nullify
  validates :name, :presence => true
  has_many :user_groups_variants
  has_many :variants, :through => :user_groups_variants

  extend Spree::DisplayMoney
  money_methods :minimum_order

  include Spree::CalculatedAdjustments

  def calculator_description
    return Spree.t(:none) if calculator.nil?
    calculator.description
  end

  def price_for_variant variant, orig_price
    if calculator.is_a?(Spree::Calculator::PerVariantPricing)
      user_groups_variants.where(variant: variant).first.try(:price)
    else
      calculator.compute_item(variant, orig_price)
    end
  end

  def self.product(file)
    CSV.foreach(file.path, headers: true, encoding:'ISO-8859-1') do |row|
      product = Spree::Product.find(row["product_id"])
      if !product.nil?
        product.update_attributes(featured: row["featured"])
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding:'ISO-8859-1') do |row|
      user_group = Spree::UserGroup.find(row["user_group"])
      if user_group.user_groups_variants.find_by_variant_id(row["variant_id"]).nil?
        user_group.user_groups_variants.create!(variant_id: row["variant_id"], price: row["price"])
      else
        user_group.user_groups_variants.find_by_variant_id(row["variant_id"]).update_attributes(price: row["price"])
      end
    end
  end

  def self.stock(file)
    CSV.foreach(file.path, headers: true, encoding:'ISO-8859-1') do |row|
      stock_data = Spree::Variant.find_by_id(row["variant_id"])
      if !stock_data.nil?
        stock_data.stock_items.find_by_stock_location_id(row["location_id"]).update_attributes(count_on_hand: row["count"])
      end
    end
  end

end
