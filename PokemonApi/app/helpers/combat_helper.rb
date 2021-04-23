# frozen_string_literal: true

module CombatHelper
  def combat_simulator(combat)
    attacker = combat.attacker
    opponent = combat.opponent

    while attacker.hp.positive?
      atk = attacker.moves.sample
      opponent.hp -= atk.damage
      opponent.save!
      Action.create!(combat: combat, pokemon: attacker, move: atk)
      opponent, attacker = attacker, opponent # switching values
    end
    attacker.update!(available: false)
    combat.update!(winner_id: opponent.id)
  end
end
