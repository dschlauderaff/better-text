require 'rails_helper'

RSpec.describe Textbook, type: :model do
  it { should have_many(:adoptions).dependent(:destroy)}
  it { should have_many(:courses)}
  it { should validate_uniqueness_of(:title)}
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0)}

  describe '.inventory_cost' do
    # TODO write test
  end

  describe '.courses_attributes=' do
    # TODO write test
  end
end
