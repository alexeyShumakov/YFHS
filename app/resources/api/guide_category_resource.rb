class Api::GuideCategoryResource < JSONAPI::Resource
  attributes :name
  has_many :guides
  filter :id
end
