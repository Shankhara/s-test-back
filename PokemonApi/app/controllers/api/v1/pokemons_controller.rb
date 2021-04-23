# frozen_string_literal: true

module Api
  module V1
    class PokemonsController < ApplicationController
      before_action :set_pokemon, only: :show

      def index
        pokemons = Pokemon.all
        json_response(pokemons, 200)
      end

      def show
        json_response(@pokemon, 200)
      end

      private

      def set_pokemon
        @pokemon = Pokemon.find(pokemon_params[:id])
      end

      def pokemon_params
        params.permit(:id)
      end
    end
  end
end
