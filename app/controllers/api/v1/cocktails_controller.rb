class Api::V1::CocktailsController < ApplicationController

  def create
    new_cocktail = Cocktail.find_or_create_by(cocktail_params)
    if new_cocktail.present?
      render json: CocktailSerializer.new(new_cocktail)
    else
      render status: 404
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:cocktail_api_id)
  end

end
