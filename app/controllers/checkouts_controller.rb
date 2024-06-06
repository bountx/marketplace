
class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checkout, only: [:show, :finalize, :cancel]

  def show
    @summary = @checkout.order_summary
  end

  def create
    @cart = current_user.cart
    @checkout = @cart.build_checkout(status: 'pending')

    if @checkout.save
      redirect_to @checkout, notice: 'Checkout was successfully created.'
    else
      redirect_to cart_path(@cart), alert: 'Failed to create checkout.'
    end
  end

  def finalize
    @checkout.update(status: 'finalized')
    redirect_to @checkout, notice: 'Order has been finalized.'
  end

  def cancel
    @checkout.update(status: 'cancelled')
    redirect_to @checkout, notice: 'Order has been cancelled.'
  end

  private

  def set_checkout
    @checkout = Checkout.find(params[:id])
  end
end
