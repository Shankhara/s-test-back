# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PokemonsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/pokemons').to route_to('pokemons#index')
    end

    it 'routes to #show' do
      expect(get: '/pokemons/1').to route_to('pokemons#show', id: '1')
    end
  end
end
