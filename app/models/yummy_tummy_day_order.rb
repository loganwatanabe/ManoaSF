class YummyTummyDayOrder < ActiveRecord::Base
  attr_accessible :participant_id, :total_cost


	#callbacks
	#before_save :calculate_total_cost


	#relationships
	belongs_to :participant
	has_many :orders
	has_many :meals, :through => :orders


	#scopes
	scope :for_participant, lambda {|participant_id| where("participant_id = ?", participant_id) }
	scope :for_group, joins(:participant).lambda {|group_id| where("participant.group_id = ?", group_id) }
	scope :children_orders, joins(:participant).where("participant.role = ? ", "child")
	scope :junior_orders, joins(:participant).where("participant.role = ? ", "junior")


	#validations
	validates_presence_of :participant_id
	validates_numericality_of :participant_id, :only_integer => true, :greater_than => 0

	#probably don't even need total_cost attribute, could do method
	validates_numericality_of :total_cost, :only_integer => false, :greater_than => 0




	#methods
	def set_total_cost

	end

	def get_meals

	end

	def quantity_for_week?(number)

	end

	private

	def calculate_total_cost
	end


end
