class Api::V1::UsersController < ApplicationController

  def show
    if User.exists?(params[:id])
      render json: UserSerializer.new(User.find(params[:id]))
    else
      render status: 404
    end
  end

private

  def user_params
    params.permit(:email, :first_name, :last_name)
  end
end


# def show
#   new_user = User.find_or_create_by(user_params) do |user|
#                 user.email = params[:email]
#                 user.first_name = params[:first_name]
#                 user.last_name = params[:last_name]
#   end
#   if new_user.present?
#     render json: UserSerializer.new(new_user)
#   else
#     render status: 404
#   end
# end
