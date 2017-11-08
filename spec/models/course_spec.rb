require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:adoptions).dependent(:destroy)}
  it { should have_many(:textbooks)}
  it { should validate_uniqueness_of(:name)}
  it { should validate_numericality_of(:enrollment).
    only_integer.
    is_greater_than_or_equal_to(0)
  }
  describe '.total_cost_to_student' do
    # TODO add test for total cost 
  end
  describe '.textbooks_attributes=' do 
    # TODO add test for textbook attributes
  end
end
