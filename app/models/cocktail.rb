class Cocktail < ApplicationRecord
  has_many :user_cocktails
  has_many :users, through: :user_cocktails

  def cocktail_total_likes
    user_cocktails.where(vote: 1).count
  end

  def cocktail_total_dislikes
    user_cocktails.where(vote: 2).count
  end
end
