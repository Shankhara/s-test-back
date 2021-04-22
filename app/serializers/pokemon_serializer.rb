# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :p_type, :hp, :moves, :available
  has_many :moves
end
