class Api::V1::RecipesController < ApplicationController

  def show
    if Recipe.exists?(params[:id])
      render json: RecipeSerializer.new(Recipe.find(params[:id]))
    else
      render status: 404
    end
  end

  def create
    
    new_recipe = Recipe.find_or_create_by(recipe_params)
    if new_recipe.present?
      render json: RecipeSerializer.new(new_recipe)
    else
      render status: 404
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_api_id)
  end

end
