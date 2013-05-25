class Absence < ActiveRecord::Base
  attr_accessible :days_gone, :end_date, :participant_id, :reason, :start_date

  belongs_to :participant
  
end
