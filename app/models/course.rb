class Course < ApplicationRecord
  has_many :adoptions
  has_many :textbooks, through: :adoptions

  validates :name, presence: true, uniqueness: true
  validates :enrollment, numericality: {only_integer: true, :greater_than_or_equal_to => 0}

  def total_cost_to_student
    textbooks.sum {|textbook| textbook.price}
  end

  

end
