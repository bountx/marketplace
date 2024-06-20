class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @purchase_history = current_user.purchase_history || current_user.create_purchase_history
    @carts = @purchase_history.carts
  end

  def finalize_purchase
    @cart = current_user.cart
    @purchase_history = current_user.purchase_history || current_user.create_purchase_history
    @cart.update(purchase_history: @purchase_history)
    @cart.update(user: nil)
    @purchase_history.carts << @cart
    current_user.purchase_history.update(carts: @purchase_history.carts)
    current_user.update(cart: Cart.create(user_id: current_user.id))

  #  @cart = current_user.cart
   # @purchase_history = current_user.purchase_history || current_user.create_purchase_history
    #@cart.update(purchase_history: @purchase_history)
    #@purchase_history.carts << @cart
    #@purchase_history.save
    #current_user.update(cart: Cart.create)
    redirect_to purchase_history_path, notice: 'Purchase finalized successfully.'
  end
end
