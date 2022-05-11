class OrganizationSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :suite, :city, :state, :zip, :phone, :mission, :website
  belongs_to :category
  has_and_belongs_to_many :users

  attribute :announcements do |organization|
    organization.announcements.map do |announcement|
      {
        comment: announcement.comment
      }
    end
  end

  # has_many :announcements, serializer: AnnouncementSerializer
end