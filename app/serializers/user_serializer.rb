class UserSerializer
  include JSONAPI::Serializer
  attributes :firstname, :lastname, :title, :email
  has_many :organizations, serializer: OrganizationSerializer
  
end