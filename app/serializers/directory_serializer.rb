class DirectorySerializer
  include JSONAPI::Serializer
  attributes :name

	has_many :categories, serializer: CategorySerializer
end