class Recipe < ApplicationRecord
  has_many :user_recipes
  has_many :users, through: :user_recipes

  def recipe_total_likes
    user_recipes.where(vote: 1).count
  end

  def recipe_total_dislikes
    user_recipes.where(vote: 2).count
  end
end
