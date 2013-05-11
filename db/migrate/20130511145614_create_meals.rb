class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :food
      t.date :date
      t.float :cost
      t.integer :number

      t.timestamps
    end
  end
end
