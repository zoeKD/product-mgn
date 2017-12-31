class UsersController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:show], if: :json_request?

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def json_request?
    request.format.symbol == :json
  end
end
