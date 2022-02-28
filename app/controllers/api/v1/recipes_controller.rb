class Api::V1::RecipesController < ApplicationController

  def show
    if Recipe.exists?(params[:id])
      render json: RecipeSerializer.new(Recipe.find(params[:id]))
    else
      render status: 404
    end
  end

  def create
    new_recipe = Recipe.find_or_create_by(recipe_api_id: params[:recipe_api_id])
    user = User.find_by(email: params[:email])
    if new_recipe.present? && params[:vote] == 'like'
      UserRecipe.create(user_id: user.id, recipe_id: new_recipe.id, vote: 1)
      render json: RecipeSerializer.new(new_recipe)
    elsif new_recipe.present? && params[:vote] == 'dislike'
      UserRecipe.create(user_id: user.id, recipe_id: new_recipe.id, vote: 2)
      render json: RecipeSerializer.new(new_recipe)
    else
      render status: 404
    end
  
  end

  # private

  # def recipe_params
  #   params.require(:recipe).permit(:recipe_api_id)
  # end

end
