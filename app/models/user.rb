class User < ApplicationRecord
  has_many :user_recipes
  has_many :recipes, through: :user_recipes
  has_many :user_cocktails
  has_many :cocktails, through: :user_cocktails
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
            :presence => {message: "can't be blank"},
            :uniqueness => true

  def recipe_total_likes
    recipes.where(user_recipes: {vote: 1}).pluck(:recipe_api_id)
  end

  def recipe_total_dislikes
    recipes.where(user_recipes: {vote: 2}).pluck(:recipe_api_id)
  end

  def cocktail_total_likes
    cocktails.where(user_cocktails: {vote: 1}).pluck(:cocktail_api_id)
  end

  def cocktail_total_dislikes
    cocktails.where(user_cocktails: {vote: 2}).pluck(:cocktail_api_id)
  end
end
