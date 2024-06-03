class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = current_user.cart || current_user.create_cart
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: cart_item_params[:product_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: cart_item_params[:product_id])
    if @cart_item.new_record?
      @cart_item.quantity = cart_item_params[:quantity].to_i
    else
      @cart_item.quantity += cart_item_params[:quantity].to_i
    end

    if @cart_item.save
      redirect_to cart_path(@cart), notice: 'Item added to cart.'
    else
      redirect_to products_path, alert: 'Could not add item to cart.'
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_path(@cart_item.cart), notice: 'Cart item updated.'
    else
      redirect_to cart_path(@cart_item.cart), alert: 'Could not update cart item.'
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@cart_item.cart), notice: 'Cart item removed.'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end