# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PokemonsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/pokemons').to route_to('api/v1/pokemons#index')
    end

    it 'routes to #show' do
      expect(get: 'api/v1/pokemons/1').to route_to('api/v1/pokemons#show', id: '1')
    end
  end
end
