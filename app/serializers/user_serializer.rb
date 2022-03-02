class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email


  attribute :recipe_likes do |object|
    object.recipe_total_likes
  end

  attribute :recipe_dislikes do |object|
    object.recipe_total_dislikes
  end

  attribute :cocktail_likes do |object|
    object.cocktail_total_likes
  end

  attribute :cocktail_dislikes do |object|
    object.cocktail_total_dislikes
  end
end
