class Adoption < ApplicationRecord
  belongs_to :textbook
  belongs_to :course


  def order_to_enrollment
    if !ordered
      textbook.update(inventory:  textbook.inventory + course.enrollment)
      update(ordered: true)
    end
  end

  def self.courses_without_books
    self.includes(:course).where(ordered: false).order("courses.name asc")
  end
end
