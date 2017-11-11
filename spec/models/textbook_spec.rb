require 'rails_helper'

RSpec.describe Textbook, type: :model do
  it { should have_many(:adoptions).dependent(:destroy)}
  it { should have_many(:courses)}
  it { should validate_uniqueness_of(:title)}
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0)}

  describe '#inventory_cost' do
    it "returns the total cost of the textbook in inventory" do
      #setup
      textbook = Textbook.create(title: "test title", price: 45, inventory: 10)
      expected_result = 45 * 10

      #exercise
      cost = textbook.inventory_cost
      
      #verify
      expect(cost).to eq expected_result
    end
  end

  describe '#courses_attributes=' do
    # TODO write test
  end
end
