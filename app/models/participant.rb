class Participant < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :grade, :group_id, :last_name, :nickname, :notes, :role
end
