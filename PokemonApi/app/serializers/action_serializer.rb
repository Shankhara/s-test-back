# frozen_string_literal: true

class ActionSerializer < ActiveModel::Serializer
  attributes :id, :pokemon_name, :move_name, :move_damage

  def pokemon_name
    object.pokemon.name
  end

  def move_name
    object.move.name
  end

  def move_damage
    object.move.damage
  end
end
