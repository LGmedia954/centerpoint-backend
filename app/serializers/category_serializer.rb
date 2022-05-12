class CategorySerializer
  include JSONAPI::Serializer
  attributes :name
  belongs_to :directory

  attribute :organizations do |category|
    category.organizations.map do |organization|
      {
        name: organization.name
      }
    end
  end

	has_many :organizations, serializer: OrganizationSerializer
end