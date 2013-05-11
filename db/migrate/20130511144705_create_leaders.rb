class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.date :date_of_birth
      t.string :notes
      t.string :phone
      t.string :specialty

      t.timestamps
    end
  end
end
