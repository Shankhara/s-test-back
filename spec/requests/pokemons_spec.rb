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
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_pokemon_url(Pokemon.first.id)
      expect(status).to eq 200
      expect(json['name']).to eq Pokemon.first.name
    end
  end
end
