class User < ApplicationRecord
  has_secure_password
  belongs_to :organization
	has_many :announcements, through organization
	has_many :promos, through organization
	has_many :events, through organization

  validates :firstname, :lastname, :title, presence: true
  validates :email, uniqueness: true
end
