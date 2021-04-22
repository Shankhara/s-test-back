# frozen_string_literal: true

class Combat < ApplicationRecord
  before_validation :compute_xp_gain

  validates :attacker_id, presence: true, numericality: true
  validates :opponent_id, presence: true, numericality: true
  validates :xp_gain, presence: true, numericality: true

  has_many :actions, dependent: :destroy
  belongs_to :attacker, class_name: 'Pokemon'
  belongs_to :opponent, class_name: 'Pokemon'

  def compute_xp_gain
    self.xp_gain = attacker.exp + opponent.exp
  end

  def attacker_actions
    actions.where(pokemon_id: attacker_id)
  end

  def opponent_actions
    actions.where(pokemon_id: opponent_id)
  end
end
