class PageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_many :headers
  has_many :links
end