# frozen_string_literal: true

class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.belongs_to(:combats, foreign_key: true)
      t.belongs_to(:pokemon, foreign_key: true)
      t.belongs_to(:move, foreign_key: true)
      t.timestamps
    end
  end
end
