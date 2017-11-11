require 'rails_helper'

RSpec.describe Adoption, type: :model do
  let (:textbook) {FactoryBot.create(:textbook) }
  let (:course)   {FactoryBot.create(:course)}
  let (:textbook2) {FactoryBot.create(:textbook) }
  let (:course2)   {FactoryBot.create(:course)}

  it { should belong_to(:textbook)}
  it { should belong_to(:course)}
  
  describe '#order_to_enrollment' do
    it "sets a textbook's inventory equal to course enrollment and updates adoption ordered status to true" do
      # setup
      textbook.courses << course
      
      #exercise
      Adoption.first.order_to_enrollment
      
      #verify
      expect(Textbook.first.inventory).to eq course.enrollment
      expect(Adoption.first.ordered).to be true
    end
    
    it "does not increase inventory if ordered status is true" do
      textbook.courses << course
      
      #exercise
      Adoption.first.update(ordered: true)
      Adoption.first.order_to_enrollment
      
      #verify
      expect(Textbook.first.inventory).to eq textbook.inventory
    end
  end
  
  describe '.courses_without_books' do 
    it "lists adoptions where ordered status is false" do
      # setup
      textbook.courses << course
      textbook2.courses << course2

      # exercise
      Adoption.first.update(ordered: true)
      result = Adoption.courses_without_books

      #verify
      expect(result).not_to include(Adoption.first)
    end
  end
end
