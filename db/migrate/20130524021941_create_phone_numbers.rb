class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :phone
      t.string :type
      t.integer :contact_id

      t.timestamps
    end
  end
end
