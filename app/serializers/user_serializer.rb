class UserSerializer
  include JSONAPI::Serializer
  attributes :firstname, :lastname, :title, :email

  attribute :organization do |user|
    {
      name: user.organization.name,
      address: user.organization.address,
      suite: user.organization.suite,
      city: user.organization.city,
      state: user.organization.state,
      zip: user.organization.zip,
      phone: user.organization.phone,
      mission: user.organization.mission,
      website: user.organization.website
    }
  end

  # has_many :organizations, serializer: OrganizationSerializer
end