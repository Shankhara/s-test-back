# frozen_string_literal: true

class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :p_type
      t.integer :hp
      t.integer :moves, array: true, default: []
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
