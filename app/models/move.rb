# frozen_string_literal: true

class Move < ApplicationRecord
  validates :name, presence: true
  validates :damage, presence: true, numericality: true

  belongs_to :pokemon
  has_many :actions
end
