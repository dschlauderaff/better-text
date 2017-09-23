class Adoption < ApplicationRecord
  belongs_to :textbook
  belongs_to :course
end
