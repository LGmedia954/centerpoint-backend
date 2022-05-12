class CategorySerializer
  include JSONAPI::Serializer
  attributes :name
  belongs_to :directory
  has_many :organizations, serializer: OrganizationSerializer

  # check this
  attribute :organizations do |category, organization|
    category.organization.name
  end

end