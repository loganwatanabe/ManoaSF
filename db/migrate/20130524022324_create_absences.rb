class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.date :start_date
      t.date :end_date
      t.integer :participant_id
      t.string :reason
      t.integer :days_gone

      t.timestamps
    end
  end
end
