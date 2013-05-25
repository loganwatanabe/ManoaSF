class Leader < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :last_name, :nickname, :notes, :phone, :specialty, :female



	#callbacks
	before_save :reformat_phone


	########gender

	#relationships
	has_one :group
	#has_many :participants, :through => :groups


	#scopes
	scope :alphabetical, order('last_name, first_name')
	scope :by_age, order('date_of_birth')
	scope :females, where('female = ?', true)#######
    scope :males, where('female = ?', false)########




	#validations
	validates_presence_of :first_name, :last_name
 	validates_date :date_of_birth, :on_or_before => lambda { 16.years.ago }, :on_or_before_message => "must be at least 16 years old"
  	validates_format_of :phone, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :message => "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
	validates_inclusion_of :female, :in => [true, false], :message => "must be true or false", :allow_nil => false


	#methods
	def gender ##################
      return "Female" if female
      "Male"
      # female ? "Female" : "Male"
    end  

	def name
    	"#{last_name}, #{first_name}"
  	end
  
  	def proper_name
    	"#{first_name} #{last_name}"
  	end
  
	def age
	  now = Time.now.utc.to_date
	  now.year - date_of_birth.year - (date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
	end
  	
	private

	def reformat_phone
	    phone = self.phone.to_s  # change to string in case input as all numbers 
	    phone.gsub!(/[^0-9]/,"") # strip all non-digits
		self.phone = phone       # reset self.phone to new string
	end




end
