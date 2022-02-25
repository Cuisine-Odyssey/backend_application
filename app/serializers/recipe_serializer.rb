class RecipeSerializer
  include JSONAPI::Serializer
  attributes :recipe_api_id

  attribute :sum_likes do |object|
    object.recipe_total_likes
  end

  attribute :sum_dislikes do |object|
    object.recipe_total_dislikes
  end
end
