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
    user_recipe = UserRecipe.find_or_create_by(user_id: user.id, recipe_id: new_recipe.id)
    if new_recipe.present? && params[:vote] == 'like'
      user_recipe.update(vote: 1)
      render json: RecipeSerializer.new(new_recipe)
    elsif new_recipe.present? && params[:vote] == 'dislike'
      user_recipe.update(vote: 2)
      render json: RecipeSerializer.new(new_recipe)
    else
      render status: 404
    end
  end
end
