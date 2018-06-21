Spree::Variant.class_eval do

  has_many :sale_prices, through: :prices

  delegate :sale_price, :original_price, :on_sale?, to: :default_price

  def put_on_sale value, params={}
    if !params[:currency] or params[:currency] == 'all_currencies' or params[:currency] == :all_currencies
      run_on_prices(true) { |p| p.put_on_sale value, params }
    elsif params[:currency]
      prices.find_by(currency: params[:currency]).put_on_sale(value, params) if prices.exists?(currency: params[:currency])
    end
  end
  alias :create_sale :put_on_sale

  # TODO make update_sale method

  def active_sale_in(currency)
    price_in(currency).active_sale
  end
  alias :current_sale_in :active_sale_in

  def next_active_sale_in(currency)
    price_in(currency).next_active_sale
  end
  alias :next_current_sale_in :next_active_sale_in

  def sale_price_in(currency)
    Spree::Price.new variant_id: self.id, currency: currency, amount: price_in(currency).sale_price
  end

  def discount_percent_in(currency)
    price_in(currency).discount_percent
  end

  def on_sale_in?(currency)
    price_in(currency).on_sale?
  end

  def original_price_in(currency)
    Spree::Price.new variant_id: self.id, currency: currency, amount: product.original_price
  end

  def enable_sale(all_currencies = true)
    run_on_prices(all_currencies) { |p| p.enable_sale }
  end

  def disable_sale(all_currencies = true)
    run_on_prices(all_currencies) { |p| p.disable_sale }
  end

  def start_sale(end_time = nil, all_currencies = true)
    run_on_prices(all_currencies) { |p| p.start_sale end_time }
  end

  def stop_sale(all_currencies=true)
    run_on_prices(all_currencies) { |p| p.stop_sale }
  end

  private
    def run_on_prices(all_currencies, &block)
      if all_currencies && prices.present?
        prices.each { |p| block.call p }
      else
        block.call default_price
      end
    end
end
