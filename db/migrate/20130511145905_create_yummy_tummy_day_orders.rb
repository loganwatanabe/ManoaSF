class CreateYummyTummyDayOrders < ActiveRecord::Migration
  def change
    create_table :yummy_tummy_day_orders do |t|
      t.integer :participant_id
      t.float :total_cost

      t.timestamps
    end
  end
end
