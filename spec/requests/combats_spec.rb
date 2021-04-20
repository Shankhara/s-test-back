# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/combats', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      Combat.create! valid_attributes
      get combats_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Combat' do
        expect do
          post combats_url,
               params: { combat: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Combat, :count).by(1)
      end

      it 'renders a JSON response with the new combat' do
        post combats_url,
             params: { combat: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
