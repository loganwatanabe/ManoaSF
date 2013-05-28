class Group < ActiveRecord::Base
  attr_accessible :homeroom, :leader_id, :max_age, :max_grade, :min_age, :min_grade, :name, :rotation



	#callbacks



	#relationships
	has_many :participants
	belongs_to :leader
	has_many :yummy_tummy_day_orders, :through => :participants


	#scopes
	scope :alphabetical, order('name')
	scope :for_rotation, lambda{|rotation| where("rotation = ? ", rotation) }


	#validations
	validates_presence_of :name
  	validates_numericality_of :leader_id, :only_integer => true, :greater_than => 0, :allow_nil => true
  	validates_numericality_of :rotation, :only_integer => true, :greater_than => 0, :allow_nil => true

  		#this should only be used for checking children, not junior leaders [possibly unecessary]
	validates_numericality_of :min_grade, :only_integer => true, :greater_than_or_equal_to => 0, :allow_nil => true
	validates_numericality_of :max_grade, :only_integer => true, :greater_than_or_equal_to => :min_grade, :allow_nil => true
	validates_numericality_of :min_age, :only_integer => true, :greater_than_or_equal_to => 3, :allow_nil => true
	validates_numericality_of :max_age, :only_integer => true, :greater_than_or_equal_to => :min_age, :allow_nil => true


	#methods

	# TEST THESE
	def children
		kids = Participant.for_group(self.id).children.alphabetical
		kids
	end

	def juniors
		jr = Participant.for_group(self.id).juniors.alphabetical
		jr
	end

	#get all meals for a group




end
