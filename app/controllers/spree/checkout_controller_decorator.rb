Spree::CheckoutController.class_eval do
  # def ensure_checkout_allowed
  #   check = @order.checkout_allowed?
  #   unless check == true
  #     redirect_to spree.cart_path, :flash => {:error => "Order needs to be greater than ₱500 to checkout" }
  #   end
  # end


  require 'slack-notifier'
  def update
    if @order.update_from_params(params, permitted_checkout_attributes, request.headers.env)
      @order.temporary_address = !params[:save_user_address]
      unless @order.next
        flash[:error] = @order.errors.full_messages.join("\n")
        redirect_to(checkout_state_path(@order.state)) && return
      end

      if @order.completed?
        @current_order = nil
        flash.notice = Spree.t(:order_processed_successfully)
        flash['order_completed'] = true
        notifier_order = Slack::Notifier.new "https://hooks.slack.com/services/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" do
          defaults channel: "#orders",
                   username: "VCSI Order BOT"
        end
        notifier_order.ping "#{@order.name} created an Order."
        redirect_to completion_route
      else
        redirect_to checkout_state_path(@order.state)
      end
    else
      render :edit
    end
  end

end
