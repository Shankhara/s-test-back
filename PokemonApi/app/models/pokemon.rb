# frozen_string_literal: true

class Pokemon < ApplicationRecord
  after_update :zero_hp

  validates :name, presence: true
  validates :p_type, presence: true
  validates :hp, presence: true, numericality: true
  validates :exp, presence: true, numericality: true
  validates :available, inclusion: [true, false]
  has_many :moves, dependent: :destroy
  has_many :combats, dependent: :nullify

  def zero_hp
    self.hp = 0 if hp.negative?
  end
end
