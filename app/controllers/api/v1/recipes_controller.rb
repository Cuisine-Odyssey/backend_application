class Api::V1::RecipesController < ApplicationController

  def show
    if Recipe.exists?(params[:id])
      render json: RecipeSerializer.new(Recipe.find(params[:id]))
    else
      render status: 404
    end
  end
end
