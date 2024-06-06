
class Checkout < ApplicationRecord
  belongs_to :cart
  enum status: { pending: 'pending', finalized: 'finalized', cancelled: 'cancelled' }

  def order_summary
    cart_items = cart.cart_items.includes(:product)
    summary = cart_items.map do |item|
      {
        product_name: item.product.name,
        quantity: item.quantity,
        price: item.product.price,
        total: item.product.price * item.quantity
      }
    end
    summary << { total_price: cart_items.sum { |item| item.product.price * item.quantity }}
  end
end
