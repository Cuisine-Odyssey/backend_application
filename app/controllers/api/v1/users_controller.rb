class Api::V1::UsersController < ApplicationController

  def show
    user = User.find_by(email: params[:email])
    if user.present?
      render json: UserSerializer.new(user)
    else
      render status: 404
    end
  end

  def create
    new_user = User.find_or_create_by(user_params)
    if new_user.present?
      render json: UserSerializer.new(new_user)
    else
      render status: 404
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
