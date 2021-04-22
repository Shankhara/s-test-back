# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    p_type { %w[Fire Water Grass Electric Psychic].sample }
    exp { rand(0..100) }
    hp { rand(60..150) }
    transient { nb_moves { 3 } }
    after(:create) do |pokemon, eval|
      create_list(:move, eval.nb_moves, pokemon: pokemon)
    end
  end
end
