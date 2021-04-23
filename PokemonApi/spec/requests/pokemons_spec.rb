# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/pokemons', type: :request do
  before { create_list(:pokemon, 3) }
  describe 'GET /index' do
    it 'renders a successful response' do
      get api_v1_pokemons_url
      expect(status).to eq 200
      expect(json.size).to eq 3
    end
    it "renders through param 'available'", test: true do
      get api_v1_pokemons_url, params: { available: false }
      expect(status).to eq 200
      expect(json).to eq nil
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_pokemon_url(Pokemon.first.id)
      expect(status).to eq 200
      expect(json['name']).to eq Pokemon.first.name
    end
    context 'render error' do
      it 'when not found' do
        get api_v1_pokemon_url(876)
        expect(json['error']).to eq ["Couldn't find Pokemon with 'id'=876"]
      end
    end
  end
end
