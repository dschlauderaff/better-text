class Adoption < ApplicationRecord
  belongs_to :textbook
  belongs_to :course

  def order_to_enrollment
    if !ordered
      textbook.update(inventory:  textbook.inventory + course.enrollment)
      update(ordered: true)
    end
  end
end
