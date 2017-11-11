require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:adoptions).dependent(:destroy)}
  it { should have_many(:textbooks)}
  it { should validate_uniqueness_of(:name)}
  it { should validate_numericality_of(:enrollment).
    only_integer.
    is_greater_than_or_equal_to(0)
  }
  let(:books) {create_list(:textbook, 2)}
  let(:course) {create(:course)}

  describe '#total_cost_to_student' do
    it "adds up the price of all books adopted for a course" do
      #setup
      course.textbooks << books
      control = books[0].price + books[1].price

      #exercise
      cost = course.total_cost_to_student

      #verify
      expect(cost).to eq control
    end
  end
  describe '#textbooks_attributes=' do 
    # TODO add test for textbook attributes
  end
end
