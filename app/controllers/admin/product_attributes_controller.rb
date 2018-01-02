class Admin::ProductAttributesController < ApplicationController

  def index
    @attributes = ProductAttribute.all
  end

  def create
    @attribute = ProductAttribute.new(name: params[:attribute].capitalize)
    if @attribute.save
      redirect_to :admin_product_attributes
    else
      render :index
    end
  end

  def destroy
    @attribute = ProductAttribute.find(params[:id])
    @attribute.destroy
    redirect_to :admin_product_attributes
  end
end
