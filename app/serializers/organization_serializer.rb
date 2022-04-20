class OrganizationSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :suite, :city, :state, :zip, :phone, :mission, :website
  belongs_to :category

  end
end