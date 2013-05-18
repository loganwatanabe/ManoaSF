class YummyTummyDayOrder < ActiveRecord::Base
  attr_accessible :participant_id, :total_cost


	#callbacks
	# before_update :calculate_total_cost


	#relationships
	belongs_to :participant
	has_many :orders
	has_many :meals, :through => :orders


	#scopes
	scope :alphabetical, joins(:participant).order('last_name, first_name')
	scope :for_participant, lambda {|participant_id| where("participant_id = ?", participant_id) }
	scope :for_group, lambda {|group_id| joins(:participant).where("group_id = ?", group_id) }
	scope :children_orders, joins(:participant).where("role = ? ", "child")
	scope :junior_orders, joins(:participant).where("role = ? ", "junior")


	#validations
	validates_presence_of :participant_id
	validates_numericality_of :participant_id, :only_integer => true, :greater_than => 0

	# probably don't even need total_cost attribute, could do method
	validates_numericality_of :total_cost, :only_integer => false, :greater_than => 0, :allow_nil => true




	#methods

	def calculate_total_cost
		cost_array = self.orders.map{|o| o.cost}
		unless cost_array.empty?
			return cost_array.inject{|sum, i| sum + i}
		else
			return nil
		end
	end

	def get_meals
		self.orders.map{|o| o.meal}
	end

	def quantity_for_meal(meal)
		order = self.orders.select{|o| o.meal == meal}.first
		if order.nil?
			return 0
		else
			return order.quantity
		end
	end

	private

	# def calculate_total_cost
	# 	cost_array = self.orders.map{|o| o.cost}
	# 	unless cost_array.empty?
	# 		self.total_cost = cost_array.inject{|sum, i| sum + i}
	# 		self.total_cost.save!
	# 	else
	# 		self.total_cost = nil
	# 		self.total_cost.save!
	# 	end
	# end


end
