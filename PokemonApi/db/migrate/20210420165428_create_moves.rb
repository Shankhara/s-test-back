# frozen_string_literal: true

class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :damage
      t.belongs_to(:pokemon, foreign_key: true)
      t.timestamps
    end
  end
end
