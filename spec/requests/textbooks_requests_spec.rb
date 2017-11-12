require 'rails_helper'

RSpec.describe 'Textbooks API', type: :request do
  # Initial Test data
  let!(:textbooks) { FactoryBot.create_list(:textbook, 5)}

  # GET /textbooks
  #   return collection of textbooks
  describe 'GET /textbooks' do

    before { get '/textbooks.json' }

    it 'returns a status code of 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a colletion of videos in JSON' do
      json = JSON.parse(response.body)

      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end
  # POST /textbooks
  #   creates a textbook and returns that textbook
  # GET /textbooks/:id
  #   return a textbook matching the parameters :id
  # PUT /textbooks/:id
  #   update and return the textbook matching the parameter :id
  # DELETE /textbooks/:id
  #   destroy the textbook matching the parameter :id
end