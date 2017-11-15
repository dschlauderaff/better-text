class AdoptionSerializer < ActiveModel::Serializer
  attributes :id, :course_id, :textbook_id, :ordered
  belongs_to :course
  belongs_to :textbook
end