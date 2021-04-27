# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :subtotal
      t.integer :total

      t.timestamps
    end
  end
end
