# frozen_string_literal: true

FactoryBot.define do
  factory :combat do
    attacker { create(:pokemon) }
    opponent { create(:pokemon) }
    xp_gain { rand(0..100) }
    transient { count { 3 } }
    after(:create) do |combat, eval|
      create_list(:action, eval.count, pokemon: combat.attacker, combat: combat, move: combat.attacker.moves.sample)
      create_list(:action, eval.count, pokemon: combat.opponent, combat: combat, move: combat.opponent.moves.sample)
    end
  end
end
