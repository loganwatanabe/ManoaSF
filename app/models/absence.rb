class Absence < ActiveRecord::Base

  #callbacks

  #relationships
  belongs_to :participant

  #scopes
  scope :for_participant, lambda{|participant_id| where("participant_id = ?", participant_id) }
  scope :chronological, order('start_date, end_date')

  #validations
  validates_presence_of :participant_id, :start_date, :end_date
  validates_numericality_of :participant_id, :only_integer => true, :greater_than => 0
  validates_numericality_of :days_gone, :only_integer => true, :greater_than => 0, :allow_nil => true
  validates_date :start_date, :allow_blank => false
  validates_date :end_date, :on_or_after => :start_date, :allow_blank => true


  #methods






  
end
