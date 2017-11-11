require 'rails_helper'

RSpec.describe Adoption, type: :model do
  it { should belong_to(:textbook)}
  it { should belong_to(:course)}
  
  describe 'Adoption, #order_to_enrollment' do
    it "sets a textbook's inventory equal to course enrollment" do
      textbook = FactoryBot.create(:textbook)
      course = FactoryBot.create(:course)

      textbook.courses << course
      # binding.pry
      adoption = Adoption.first

      adoption.order_to_enrollment

      textbook = Textbook.first

      expect(textbook.inventory).to eq course.enrollment
    end
  end

  describe '.courses_without_books' do 
    # TODO write test
  end
end
