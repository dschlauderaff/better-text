require 'rails_helper'

RSpec.describe 'courses API', type: :request do
  # Initial Test data
  let!(:courses) { FactoryBot.create_list(:course, 5)}

  # GET /courses
  #   return collection of courses
  describe 'GET /courses' do
    before { get '/courses.json' }
    
    it 'returns a status code of 200' do
      expect(response).to have_http_status(200)
    end
    
    it 'returns a colletion of courses in JSON' do
      json = JSON.parse(response.body)

      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end
end