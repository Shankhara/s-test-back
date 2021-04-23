# frozen_string_literal: true

FactoryBot.define do
  factory :action do
    combat
    pokemon
    move
  end
end
