class Leader < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :last_name, :nickname, :notes, :phone, :specialty



	#callbacks
	before_save :reformat_phone


	#relationships
	has_one :group
	has_many :participants, :through => :group


	#scopes
	scope :alphabetical, order('last_name, first_name')




	#validations
	validates_presence_of :first_name, :last_name
 	validates_date :date_of_birth, :on_or_before => lambda { 16.years.ago }, :on_or_before_message => "must be at least 16 years old"
  	validates_format_of :phone, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :message => "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true



	#methods
	def name
    	"#{last_name}, #{first_name}"
  	end
  
  	def proper_name
    	"#{first_name} #{last_name}"
  	end
  
  	def age
    	return nil if date_of_birth.blank?
    	(Time.now.to_s(:number).to_i - date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
  	end
  	
	private

	def reformat_phone
	    phone = self.phone.to_s  # change to string in case input as all numbers 
	    phone.gsub!(/[^0-9]/,"") # strip all non-digits
		self.phone = phone       # reset self.phone to new string
	end




end
