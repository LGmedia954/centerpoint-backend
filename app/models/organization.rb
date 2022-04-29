class Organization < ApplicationRecord
  belongs_to :user
	belongs_to :category
	has_many :announcements
	# has_many :promos
	# has_many :events

  validates :address, :city, :state, :zip, :phone, presence: true
  validates :name, uniqueness: true

	scope :by_name, -> { order(name: :asc) }

end