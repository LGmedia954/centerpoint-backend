class Announcement < ApplicationRecord
  belongs_to :user
	belongs_to :organization

  scope :recent, -> { order(created_at: :desc) }

end