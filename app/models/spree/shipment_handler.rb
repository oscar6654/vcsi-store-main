module Spree
  class ShipmentHandler
    class << self
      def factory(shipment)
        # Do we have a specialized shipping-method-specific handler? e.g:
        # Given shipment.shipping_method = Spree::ShippingMethod::DigitalDownload
        # do we have Spree::ShipmentHandler::DigitalDownload?
        if sm_handler = "Spree::ShipmentHandler::#{shipment.shipping_method.name.split('::').last}".safe_constantize
          sm_handler.new(shipment)
        else
          new(shipment)
        end
      end
    end

    def initialize(shipment)
      @shipment = shipment
    end

    def perform
      @shipment.inventory_units.each &:ship!
      @shipment.process_order_payments if Spree::Config[:auto_capture_on_dispatch]
      @shipment.touch :shipped_at
      update_order_shipment_state
      send_shipped_email
    end

    private

    def send_shipped_email
      ShipmentMailer.shipped_email(@shipment.id).deliver_later
    end
    require 'chikka'
    require 'httparty'
    require 'addressable/uri'

    def send_message(message: nil, number: nil)
      uri     = Addressable::URI.new

      options = {
        apikey:     ENV['SEMAPHORE_API_KEY'],
        number:     number,
        message:    message,
        sendername: ENV['SEMAPHORE_SENDERNAME']
      }

      uri.query_values = options
      path = "http://api.semaphore.co/api/v4/messages?#{uri.query}"

      response = HTTParty.post(path)
    end

    def update_order_shipment_state
      order = @shipment.order
      if @shipment.order.ship_address.phone.length > 10
        @phone = @shipment.order.ship_address.phone.chars.last(10).join
        @phone = "0" + @phone
        send_message(message: "We are delivering your order #{order.number} to you today via eMarket Delivery. Please prepare cash for payment if via COD. Thank You.", number: @phone)
        # client = Chikka::Client.new(client_id:ENV["CHIKKA_CLIENT_ID"], secret_key:ENV["CHIKKA_SECRET_KEY"], shortcode:ENV["CHIKKA_SHORT_CODE"])
        # client.send_message(message:'(VCSI Store) Your order is being packed up and will be delivered tomorrow. *DO NOT REPLY', mobile_number: @phone)
      end
      new_state = OrderUpdater.new(order).update_shipment_state
      order.update_columns(shipment_state: new_state, updated_at: Time.current)
    end
  end
end
