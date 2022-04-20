class UserSerializer
  include JSONAPI::Serializer
  attributes :firstname, :lastname, :title, :email
  belongs_to :organization

  end
end