# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :p_type, :hp, :moves, :available
end
