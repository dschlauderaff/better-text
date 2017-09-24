class Textbook < ApplicationRecord
  has_many :adoptions
  has_many :courses, through: :adoptions

  validates :title, presence: true, uniqueness: true
  validates :price, numericality: {only_integer: true}

  accepts_nested_attributes_for :courses, reject_if: :all_blank

  def inventory_cost
    inventory * price
  end

  def course_attributes=(course_attributes)
    course_attributes.values.first do |course_attribute|
      course = Course.find_or_create_by(course_attribute)
      self.courses << course
    end
  end

end
