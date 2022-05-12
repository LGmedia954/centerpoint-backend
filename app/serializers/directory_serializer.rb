class DirectorySerializer
  include JSONAPI::Serializer
  attributes :name, :description
	has_many :categories, serializer: CategorySerializer
end