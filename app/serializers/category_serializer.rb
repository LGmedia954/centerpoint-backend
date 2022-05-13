class CategorySerializer
  include JSONAPI::Serializer
  attributes :name
  belongs_to :directory
  has_many :organizations, serializer: OrganizationSerializer

  attribute :organization do |category|
    {
      name: category.organization.name
    }
  end

end