class TextbookSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :inventory
  has_many :courses
  has_many :adoptions
end
