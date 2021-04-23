# frozen_string_literal: true

FactoryBot.define do
  factory :move do
    name { Faker::Games::Pokemon.move }
    damage { rand(5..100) }
  end
end
