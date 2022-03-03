class Api::V1::CocktailsController < ApplicationController

  def create
    new_cocktail = Cocktail.find_or_create_by(cocktail_api_id: params[:cocktail_api_id])
    user = User.find_by(email: params[:email])
    user_cocktail = UserCocktail.find_or_create_by(user_id: user.id, cocktail_id: new_cocktail.id)
    if new_cocktail.present? && params[:vote] == 'like'
      user_cocktail.update(vote: 1)
      render json: CocktailSerializer.new(new_cocktail)
    elsif new_cocktail.present? && params[:vote] == 'dislike'
      user_cocktail.update(vote: 2)
      render json: CocktailSerializer.new(new_cocktail)
    else
      render status: 404
    end
  end
end
