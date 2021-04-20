# frozen_string_literal: true

class Combat < ApplicationRecord
  validates :attacker_id, presence: true, numericality: true
  validates :opponent_id, presence: true, numericality: true
  validates :winner_id, numericality: true
  validates :xp_gain, presence: true, numericality: true
  validates :attacker_actions, presence: true
  validates :opponent_actions, presence: true

  has_many :actions, dependent: :destroy
  belongs_to :attacker, class_name: 'Pokemon'
  belongs_to :opponent, class_name: 'Pokemon'
end
