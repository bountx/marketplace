class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def show
    @wishlist = current_user.wishlist || current_user.create_wishlist
    @products = @wishlist.products
  end

  def add_product
    @wishlist = current_user.wishlist || current_user.create_wishlist
    product = Product.find(params[:product_id])
    @wishlist.products << product unless @wishlist.products.include?(product)
    redirect_to wishlist_path, notice: 'Product added to wishlist.'
  end

  def remove_product
    @wishlist = current_user.wishlist
    product = Product.find(params[:product_id])
    @wishlist.products.delete(product)
    redirect_to wishlist_path, notice: 'Product removed from wishlist.'
  end

  def clear
    @wishlist = current_user.wishlist
    @wishlist.products.each do |product|
      @wishlist.products.delete(product)
    end
    redirect_to wishlist_path(@wishlist), notice: 'Wishlist was successfully cleared.'
  end

  def save
    @wishlist = current_user.wishlist
    serialized_wishlist = Marshal.dump(@wishlist)

    send_data serialized_wishlist, type: 'application/octet-stream', filename: 'wishlist_data.bin'
  end
end
