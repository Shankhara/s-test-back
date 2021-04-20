# frozen_string_literal: true

class Action < ApplicationRecord
  belongs_to :pokemon
  belongs_to :combat
  belongs_to :move
end
