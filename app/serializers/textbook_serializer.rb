class TextbookSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :inventory
end
