# frozen_string_literal: true

class Pokemon < ApplicationRecord
  validates :name, presence: true
  validates :p_type, presence: true
  validates :hp, presence: true, numericality: true
  validates :exp, presence: true, numericality: true
  validates :available, presence: true, inclusion: [true, false]
  has_many :moves, dependent: :destroy
  has_many :combats, dependent: :nullify
end
