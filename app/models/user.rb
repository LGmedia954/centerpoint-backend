class User < ApplicationRecord
  has_secure_password
  belongs_to :organization


  validates :firstname, :lastname, :title, presence: true
  validates :email, uniqueness: true
end
