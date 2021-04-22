# frozen_string_literal: true

class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :p_type
      t.integer :exp, default: 0
      t.integer :hp, default: 100
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
