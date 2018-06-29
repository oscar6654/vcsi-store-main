Spree::CheckoutController.class_eval do
  def ensure_checkout_allowed
    check = @order.checkout_allowed?
    unless check == true
      redirect_to spree.cart_path, :flash => {:error => "Order needs to be greater than ₱500 to checkout" }
    end
  end


end
