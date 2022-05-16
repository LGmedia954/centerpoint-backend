class OrganizationSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :suite, :city, :state, :zip, :phone, :mission, :website
  belongs_to :user
  belongs_to :category
  has_many :announcements, serializer: AnnouncementSerializer

end