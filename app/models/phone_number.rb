class PhoneNumber < ActiveRecord::Base

  #callbacks
  before_save :reformat_phone

  #relationships
  belongs_to :contact
  has_one :participant, :through => :contact

  #scopes
  scope :by_type, lambda { order("phone_type")}
  scope :for_contact, lambda {|contact_id| where("contact_id = ?", contact_id) }
  scope :for_participant, lambda {|participant_id| joins(:contact).where("participant_id = ?", participant_id) }
  scope :for_type, lambda {|type| where("phone_type = ?", type) }

  #validation
  TYPES = [['Home', :home],['Cellular', :cell],['Work', :work]]


  validates_presence_of :contact_id, :phone

  validates_numericality_of :contact_id, :only_integer => true, :greater_than => 0

  validates_format_of :phone, :with => /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, :message => "should be 10 digits (area code needed) and delimited with dashes only" , :allow_nil => false
  
  validates_inclusion_of :phone_type, :in => %w[cell work home], :message => "is not a recognized phone type", :allow_nil => true, :allow_blank => true


  	private

	def reformat_phone
	    phone_num = self.phone.to_s  # change to string in case input as all numbers 
	    phone_num.gsub!(/[^0-9]/,"") # strip all non-digits
		self.phone = phone_num       # reset self.phone to new string

	end

end
