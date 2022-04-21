class Directory < ApplicationRecord
  has_many :categories
	has_many :organizations, through: :categories

end
