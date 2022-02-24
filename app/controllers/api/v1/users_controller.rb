class Api::V1::UsersController < ApplicationController
  def show
    if User.exists?(params[:id])
      render json: UserSerializer.new(User.find(params[:id]))
    else
      render status: 404
    end
  end
end
