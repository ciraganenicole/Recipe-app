# frozen_string_literal: true

class CreateInventoryFood < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.float :quantity, default: 0
      t.timestamps
    end
  end
end
