class Admin::ProductsController < ApplicationController

  def attributes
    @attributes = Product.attributes
  end

  def add_attribute
    Product.attributes.push(params[:attribute].capitalize)
    redirect_to :admin_product_attributes
  end

  def delete_attribute
    attribute_id = Product.attributes.find_index(params[:attribute])
    Product.attributes.delete_at(attribute_id)
    redirect_to :admin_product_attributes
  end
end
