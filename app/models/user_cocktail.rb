class UserCocktail < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  validates_presence_of :user_id
  validates_presence_of :cocktail_id

  enum vote: ['no_vote', 'like', 'dislike']
end
