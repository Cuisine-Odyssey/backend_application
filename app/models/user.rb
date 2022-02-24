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
end
