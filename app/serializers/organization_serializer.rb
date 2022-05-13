class OrganizationSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :suite, :city, :state, :zip, :phone, :mission, :website
  # has_and_belongs_to_many :users
  belongs_to :user
  belongs_to :category
  has_many :announcements, serializer: AnnouncementSerializer

end