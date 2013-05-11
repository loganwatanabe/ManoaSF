class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :yummy_tummy_day_order_id
      t.integer :meal_id
      t.integer :quantity
      t.boolean :delivered

      t.timestamps
    end
  end
end
