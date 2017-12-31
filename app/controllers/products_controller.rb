class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]
  before_action :set_user
  skip_before_action :authenticate_user!, :only => [:all], if: :json_request?

  def index
    @products = @user.products
    respond_to do |format|
      format.html
      format.json { render :json => @products }
    end
  end

  def all
    @products = Product.all
    render json: @products
  end

  def new
    @product = Product.new
    @product.prices.build
  end

  def create
    @product = Product.new(name: params[:product][:name], size: params[:product][:size])
    @product.user = @user
    raise
    if @product.save
      redirect_to root_path
    else
      render :new
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
    params.permit(:id, :name, :size, :user, prices_attributes: [:id, :currency, :value])
  end

  def json_request?
    request.format.symbol == :json
  end
end
