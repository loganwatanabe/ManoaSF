class Order < ActiveRecord::Base
  attr_accessible :delivered, :meal_id, :quantity, :yummy_tummy_day_order_id



	#callbacks



	#relationships
	belongs_to :yummy_tummy_day_order
	has_one :participant, :through => :yummy_tummy_day_order
	belongs_to :meal


	#scopes
	scope :not_delivered, where('delivered = ?', false)
	scope :was_delivered, where('delivered = ?', true)
	scope :by_date, joins(:meal).order('date')
	scope :by_participant, joins(:participant).order('last_name, first_name')
	scope :by_number, joins(:meal).order('number')
	scope :by_food, joins(:meal).order('food')
	scope :for_meal, lambda{|meal_id| where("meal_id = ?", meal_id )}
	scope :for_ytd, lambda{|yummy_tummy_day_order_id| where("yummy_tummy_day_order_id = ?", yummy_tummy_day_order_id)}

	#scope to see orders that need to be updated?


	#validations
	validates_presence_of :meal_id, :quantity, :yummy_tummy_day_order_id #problem here

	validates_numericality_of :yummy_tummy_day_order_id, :only_integer => true, :greater_than => 0 #problem here
	validates_numericality_of :meal_id, :only_integer => true, :greater_than => 0
	validates_numericality_of :quantity, :only_integer => true, :greater_than => 0, :allow_nil => false
	validates_inclusion_of :delivered, :in => [true, false], :message => "must be true or false or nil", :allow_nil => true

	# validate :upcoming_meals_not_delivered

	#methods

	def cost
		meal_cost = self.meal.cost * quantity
		return meal_cost
	end


	private

	# def upcoming_meals_not_delivered
	# 	if self.delivered.nil?
	# 		return true
	# 	elsif self.meal.date > Date.current.to_date # if the date has not yet passed
	# 		return false #can't have delivered if the date hasn't come yet
	# 	elsif self.meal.date < Date.current.to_date
	# 		return true #here, delivered has a t/f value, but the date has passed, so its valid
	# 	end
	# end






end
