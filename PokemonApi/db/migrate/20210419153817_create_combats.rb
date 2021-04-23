# frozen_string_literal: true

class CreateCombats < ActiveRecord::Migration[6.1]
  def change
    create_table :combats do |t|
      t.integer :winner_id
      t.integer :xp_gain
      t.belongs_to(:attacker, foreign_key: { to_table: :pokemons })
      t.belongs_to(:opponent, foreign_key: { to_table: :pokemons })
      t.timestamps
    end
  end
end
