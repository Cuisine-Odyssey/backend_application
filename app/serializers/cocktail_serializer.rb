class CocktailSerializer
  include JSONAPI::Serializer
  attributes :cocktail_api_id

  attribute :sum_likes do |object|
    object.cocktail_total_likes
  end

  attribute :sum_dislikes do |object|
    object.cocktail_total_dislikes
  end
end
