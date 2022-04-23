class UserSerializer
  include JSONAPI::Serializer
  attributes :firstname, :lastname, :title, :email
  belongs_to :organization, serializer: OrganizationSerializer

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
  
end