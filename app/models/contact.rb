class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :participant_id, :phone_1, :phone_1_type, :phone_2, :phone_2_type, :relation


	#callbacks
	before_save :reformat_phone


	#relationships
	belongs_to :participant

	#scopes
	scope :for_participant, lambda {|participant_id| where("participant_id = ?", participant_id) }
	scope :alphabetical, order('last_name, first_name')


	#validations
	TYPES = [['Home', :home],['Cellular', :cell],['Work', :work]]


	validates_presence_of :first_name, :last_name, :participant_id, :relation, :phone_1

	validates_format_of :phone_1, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :message => "should be 10 digits (area code needed) and delimited with dashes only" #, :allow_blank => true
	validates_format_of :phone_2, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :message => "should be 10 digits (area code needed) and delimited with dashes only", :allow_nil => true, :allow_blank => true

	validates_inclusion_of :phone_1_type, :in => %w[cell work home], :message => "is not a recognized phone type", :allow_nil => true, :allow_blank => true
	validates_inclusion_of :phone_2_type, :in => %w[cell work home], :message => "is not a recognized phone type", :allow_nil => true, :allow_blank => true

	validates_numericality_of :participant_id, :only_integer => true, :greater_than => 0

	#methods


	def name
   		"#{last_name}, #{first_name}"
  	end
  
  	def proper_name
   	 	"#{first_name} #{last_name}"
  	end

	private

	def reformat_phone
	    phone1 = self.phone_1.to_s  # change to string in case input as all numbers 
	    phone1.gsub!(/[^0-9]/,"") # strip all non-digits
		self.phone_1 = phone1       # reset self.phone to new string

		phone2 = self.phone_2.to_s  # change to string in case input as all numbers 
	    phone2.gsub!(/[^0-9]/,"") # strip all non-digits
		self.phone_2 = phone2       # reset self.phone to new string

	end



end
