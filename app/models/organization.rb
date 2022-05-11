class Organization < ApplicationRecord
  # belongs_to :user
	has_and_belongs_to_many :users
	belongs_to :category
	has_many :announcements

  validates :address, :city, :state, :zip, :phone, presence: true
  validates :name, uniqueness: true

	# scope :by_name, -> { order(name: :asc) }

end