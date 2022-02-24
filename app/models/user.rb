class User < ApplicationRecord
  has_many :user_recipes
  has_many :recipes, through: :user_recipes
  has_many :user_cocktails
  has_many :cocktails, through: :user_cocktails
  validates_uniqueness_of :email
  has_secure_password
end
