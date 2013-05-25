class AddingAndRemovingAttributes < ActiveRecord::Migration
  def change
  	add_column :leaders, :female, :boolean
  	add_column :participants, :female, :boolean
  	add_column :participants, :school, :string
  	add_column :participants, :active, :boolean
  	add_column :groups, :name, :string
    remove_column :groups, :number
    remove_column :contacts, :phone_1
    remove_column :contacts, :phone_1_type
    remove_column :contacts, :phone_2
    remove_column :contacts, :phone_2_type
    remove_column :yummy_tummy_day_orders, :total_cost
    #remove_column :model, :attribute_to_be_removed
  end

end
