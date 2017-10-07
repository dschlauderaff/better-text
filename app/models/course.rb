class Course < ApplicationRecord
  has_many :adoptions, dependent: :destroy
  has_many :textbooks, through: :adoptions

  validates :name, presence: true, uniqueness: true
  validates :enrollment, numericality: {only_integer: true, :greater_than_or_equal_to => 0}

  def total_cost_to_student
    textbooks.sum {|textbook| textbook.price}
  end

  def textbooks_attributes=(textbook_attributes)
    if textbook_attributes.values.none? {|value| value == ""}
      textbook = Textbook.find_or_create_by(textbook_attributes)
      self.textbooks << textbook
    end
  end

end
