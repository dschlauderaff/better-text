class Textbook < ApplicationRecord
  has_many :adoptions
  has_many :courses, through: :adoptions

  validates :title, presence: true, uniqueness: true
  validates :price, numericality: {:greater_than_or_equal_to => 0}


  def inventory_cost
    inventory * price
  end

  def courses_attributes=(course_attributes)
    if course_attributes.values.none? {|value| value == ""}
      course = Course.find_or_create_by(course_attributes)
      self.courses << course
    end
  end
end
