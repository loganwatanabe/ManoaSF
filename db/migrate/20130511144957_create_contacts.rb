class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :participant_id
      t.string :relation
      t.string :phone_1
      t.string :phone_1_type
      t.string :phone_2
      t.string :phone_2_type

      t.timestamps
    end
  end
end
