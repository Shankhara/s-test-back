# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/combats', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      create_list(:combat, 2)
      get api_v1_combats_url
      expect(json.size).to eq 2
      expect(status).to eq 200
    end
  end
  describe 'POST /create' do
    it 'simulates a combat', test: true do
      pokemons = create_list(:pokemon, 2)
      post api_v1_combats_url, params: { attacker_id: pokemons[0].id, opponent_id: pokemons[1].id }
      expect(Combat.count).to eq 1
      expect(json['attacker_id']).to eq pokemons[0].id
      expect(json['opponent_id']).to eq pokemons[1].id
      expect(json['xp_gain']).to eq(pokemons[0].exp + pokemons[1].exp)
      # expect(json['winner_id']).to be_instance_of Pokemon
    end
  end
end
