class Order < ActiveRecord::Base
  attr_accessible :delivered, :meal_id, :quantity, :yummy_tummy_day_order_id



	#callbacks



	#relationships
	belongs_to :yummy_tummy_day_order
	#belongs_to :participant, :through => :yummy_tummy_day_order
	belongs_to :meal


	#scopes
	scope :not_delivered, where('delivered = ?', false)
	scope :delivered, where('delivered = ?', true)
	scope :by_meal, joins(:meal).order('meal.date')
	scope :for_meal, lambda{|meal_id| where("meal_id = ?", meal_id )}



	#validations
	validates_presence_of :meal_id, :quantity, :yummy_tummy_order_id

	validates_numericality_of :yummy_tummy_order_id, :only_integer => true, :greater_than => 0
	validates_numericality_of :meal_id, :only_integer => true, :greater_than => 0
	validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 0
	validates_inclusion_of :delivered, :in => [true, false], :message => "must be true or false", :allow_nil => true

	validate :upcoming_meals_not_delivered

	#methods

	def cost
		meal_cost = self.meal.cost
		meal_cost * quantity
	end


	private

	def upcoming_meals_not_delivered
		if self.delivered.nil?
			return true
		elsif self.meal.date > Date.current.to_date # if the date has not yet passed
			return false #can't have delivered if the date hasn't come yet
		else
			return true #here, delivered has a t/f value, but the date has passed, so its valid
		end
	end






end
