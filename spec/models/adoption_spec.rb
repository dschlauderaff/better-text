require 'rails_helper'

RSpec.describe Adoption, type: :model do
  it { should belong_to(:textbook)}
  it { should belong_to(:course)}
  
  describe '.order_to_enrollment' do
    # TODO write test
  end

  describe 'self.courses_without_books' do 
    # TODO write test
  end
end
