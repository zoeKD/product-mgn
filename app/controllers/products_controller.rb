class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]
  before_action :set_user

  def index
    @products = @user.products
    respond_to do |format|
      format.html
      format.json { render :json => @products }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = @user
    respond_to do |format|
      format.html do
        if @product.save
          redirect_to products_path
        else
          render :new
        end
      end
      format.json do
        if @product.save
          render :json => @product
        else
          render :json => { :errors => @product.errors.messages }, :status => 422
        end
      end
    end
  end

  def show

  end

  private

  def set_user
    @user = current_user
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :size, :user)
  end
end
