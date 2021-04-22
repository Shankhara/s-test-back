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
    it 'simulates a combat' do
      pokemons = create_list(:pokemon, 2)
      post api_v1_combats_url, params: { attacker_id: pokemons[0].id, opponent_id: pokemons[1].id }
      expect(Combat.count).to eq 1
      expect(status).to eq 201
      expect(json['attacker_id']).to eq pokemons[0].id
      expect(json['opponent_id']).to eq pokemons[1].id
      expect(json['xp_gain']).to eq(pokemons[0].exp + pokemons[1].exp)
      expect(json['winner_id']).to be_nonzero
    end
    context 'render errors' do
      let(:pokemons) { create_list(:pokemon, 2) }
      it 'when not found' do
        post api_v1_combats_url, params: { attacker_id: 123, opponent_id: 456 }
        expect(json['error']).to eq ["Couldn't find all Pokemons with 'id': (123, 456) (found 0 results, but was looking for 2)."]
      end
      it 'when parameter missing', test: true do
        post api_v1_combats_url, params: { attacker_id: 123 }
        expect(json['error']).to eq ["param is missing or the value is empty: opponent_id\nDid you mean?  attacker_id"]
      end
      it 'pokemon unavailable' do
        pokemons[1].toggle!(:available)
        post api_v1_combats_url, params: { attacker_id: pokemons[0].id, opponent_id: pokemons[1].id }
        expect(json['errors']).to eq ["This pokemon can't fight anymore"]
      end
      it 'pokemon unavailable (swap)' do
        pokemons[1].toggle!(:available)
        post api_v1_combats_url, params: { attacker_id: pokemons[1].id, opponent_id: pokemons[0].id }
        expect(json['errors']).to eq ["This pokemon can't fight anymore"]
      end
    end
  end
end
