class CategorySerializer
  include JSONAPI::Serializer
  attributes :name
  belongs_to :directory


	has_many :organizations, serializer: OrganizationSerializer
end