class Textbook < ApplicationRecord
  has_many :adoptions
  has_many :courses, through: :adoptions

  def inventory_cost
    inventory * price
  end

end
