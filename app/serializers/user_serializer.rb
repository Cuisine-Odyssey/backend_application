class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email

  attribute :total_likes do |object|
    object.liked_recipes
  end
end
