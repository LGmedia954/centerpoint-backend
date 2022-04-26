class AnnoucementSerializer
  include JSONAPI::Serializer
  attributes :comment
  belongs_to :user
  belongs_to :organization

end