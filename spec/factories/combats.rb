# frozen_string_literal: true

FactoryBot.define do
  factory :combat do
    attacker { create(:pokemon) }
    opponent { create(:pokemon) }
    xp_gain { rand(0..100) }
    attacker_actions { Faker::Games::Pokemon.sample(move, 4).cycle }
    opponent_actions {}
  end
end
