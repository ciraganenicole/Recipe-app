# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string  :name
      t.integer :preparation_time, default: 0
      t.integer :cooking_time, default: 0
      t.boolean :public, default: false
      t.text    :description, default: 'No description'

      t.timestamps
    end
  end
end
