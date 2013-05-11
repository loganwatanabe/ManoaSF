class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :role
      t.integer :group_id
      t.date :date_of_birth
      t.string :notes
      t.integer :grade

      t.timestamps
    end
  end
end
