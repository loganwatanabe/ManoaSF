class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :participant_id, :relation


	#callbacks


	#relationships
	belongs_to :participant
	has_many :phone_numbers####

	#scopes
	scope :for_participant, lambda {|participant_id| where("participant_id = ?", participant_id) }
	scope :alphabetical, order('last_name, first_name')


	#validations
	TYPES = [['Home', :home],['Cellular', :cell],['Work', :work]]


	validates_presence_of :first_name, :last_name, :participant_id, :relation

	validates_numericality_of :participant_id, :only_integer => true, :greater_than => 0

	#methods


	def name
   		"#{last_name}, #{first_name}"
  	end
  
  	def proper_name
   	 	"#{first_name} #{last_name}"
  	end




end
