class Textbook < ApplicationRecord
  has_many :adoptions
  has_many :courses, through: :adoptions

end
