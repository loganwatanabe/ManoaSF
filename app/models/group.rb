class Group < ActiveRecord::Base
  attr_accessible :homeroom, :leader_id, :max_age, :max_grade, :min_age, :min_grade, :number, :rotation



	#callbacks



	#relationships
	has_many :participants
	belongs_to :leader
	has_many :yummy_tummy_day_orders, :through => :participants


	#scopes
	scope :by_number, order('number')
	scope :for_rotation, lambda{|rotation| where("rotation = ? ", rotation) }


	#validations
	validates_presence_of :number
  	validates_numericality_of :leader_id, :only_integer => true, :greater_than => 0, :allow_nil => true
  	validates_numericality_of :number, :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 18
  	validates_numericality_of :rotation, :only_integer => true, :greater_than => 0

  		#this should only be used for checking children, not junior leaders [possibly unecessary]
	validates_numericality_of :min_grade, :only_integer => true, :greater_than_or_equal_to => 0, :allow_nil => true
	validates_numericality_of :max_grade, :only_integer => true, :greater_than_or_equal_to => :min_grade, :allow_nil => true
	validates_numericality_of :min_age, :only_integer => true, :greater_than_or_equal_to => 3, :allow_nil => true
	validates_numericality_of :max_age, :only_integer => true, :greater_than_or_equal_to => :min_age, :allow_nil => true


	#methods

	#get all meals for a group




end
