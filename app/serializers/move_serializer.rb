# frozen_string_literal: true

class MoveSerializer < ActiveModel::Serializer
  attributes :id, :name, :damage
  has_many :actions
end
