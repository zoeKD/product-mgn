class ProductsController < ApplicationController
  before_action :set_user, only: [:index, :create, :show]

  def index
    @products = @user.products
  end

  def new
    @product = Product.new
    @product.prices.build
  end

  def create
    attributes = { params[:product][:attributes] => params[:attributeValue] }
    @product = Product.new(name: params[:product][:name], size: params[:product][:size], product_attributes: JSON.generate(attributes))
    @product.user = @user
    if @product.save
      params[:priceNumber].to_i.times do |i|
        currency = "currency#{i+1}"
        value = "value#{i+1}"
        Price.create(currency: params[currency.to_sym], value: params[value.to_sym], product: @product)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end
end
