class Textbook < ApplicationRecord
  has_many :adoptions
  has_many :courses, through: :adoptions

  validates :title, presence: true, uniqueness: true
  validates :price, numericality: {only_integer: true}

  def inventory_cost
    inventory * price
  end

end
