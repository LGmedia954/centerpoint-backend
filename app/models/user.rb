class User < ApplicationRecord
  has_secure_password
  has_many :organizations
	has_many :announcements, through: :organization

  validates :firstname, :lastname, :title, presence: true
  validates :email, uniqueness: true

end
