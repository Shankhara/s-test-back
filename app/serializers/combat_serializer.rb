# frozen_string_literal: true

class CombatSerializer < ActiveModel::Serializer
  attributes :id, :winner_id, :xp_gain, :attacker_id, :attacker_name, :opponent_id, :opponent_name
  has_many :actions

  def attacker_name
    object.attacker.name
  end

  def opponent_name
    object.opponent.name
  end
end
