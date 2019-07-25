class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in, only: [:new, :edit]

  def index
    @products = Product.all
  end

  def show
    @user = @product.user
  end

  def new
    @product = Product.new
  end

  def edit
    if @product.user != current_user || @product.sold
      redirect_to root_path
    end
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      redirect_to root_url
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(
        :name,
        :description,
        :size,
        :condition,
        :price,
        :image
      )
    end
end
