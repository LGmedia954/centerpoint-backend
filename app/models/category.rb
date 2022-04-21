class Category < ApplicationRecord
  belongs_to :directory
	has_many :organizations

end