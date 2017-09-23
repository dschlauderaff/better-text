class Course < ApplicationRecord
  has_many :adoptions
  has_many :textbooks, through: :adoptions

  validates :name, presence: true, uniqueness: true
  validates :enrollment, numericality: {only_integer: true}

  def total_cost_to_student
    textbooks.sum {|textbook| textbook.price}
  end

end
