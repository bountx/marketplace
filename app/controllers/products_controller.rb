class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @categories = Category.all
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
    @category = Category.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @categories = Category.all # This line sets @categories
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        @categories = Category.all
        @category = Category.new
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if product_params[:images]!=[""]
        if @product.update(product_params)
          format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      else
        if @product.update(product_params_without_images)
          format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to profile_url(current_user.id), notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.

    def product_params_without_images
      params.require(:product).permit(:name, :description, :price, :category_id, :profile_id)
    end
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id, :profile_id, images: [])
    end
end
