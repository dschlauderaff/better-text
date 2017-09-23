class Course < ApplicationRecord
  has_many :adoptions
  has_many :textbooks, through: :adoptions
end
