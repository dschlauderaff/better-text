class Adoption < ApplicationRecord
  belongs_to :textbook
  belongs_to :course

  def order_to_enrollment
    textbook.update(inventory: course.enrollment)
    update(ordered: true)
  end
end
