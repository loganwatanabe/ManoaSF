class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :number
      t.integer :min_grade
      t.integer :max_grade
      t.integer :min_age
      t.integer :max_age
      t.string :homeroom
      t.integer :leader_id
      t.integer :rotation

      t.timestamps
    end
  end
end
