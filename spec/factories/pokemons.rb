# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    p_type { %w[Fire Water Grass Electric Psychic].sample }
    hp { rand(60..150) }
    moves { Faker::Games::Pokemon.sample(name, 3) }
  end
end
