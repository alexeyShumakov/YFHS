class NewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
end
