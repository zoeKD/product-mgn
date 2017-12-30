class Admin::ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.json { render :json => @products }
    end
  end

end
