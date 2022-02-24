class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates_presence_of :user_id
  validates_presence_of :recipe_id

  enum vote: ['no_vote', 'like', 'dislike']
end
