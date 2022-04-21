class Organization < ApplicationRecord
  belongs_to :category
	has_and_belongs_to_many :users
	# has_many :announcements
	# has_many :promos
	# has_many :events

  validates :address, :city, :state, :zip, :phone, presence: true
  validates :name, uniqueness: true

end