class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email

  attribute :likes do |object|
    object.total_likes
  end

  attribute :dislikes do |object|
    object.total_dislikes
  end
end
