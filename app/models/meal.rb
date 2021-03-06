class Meal < ActiveRecord::Base




	#callbacks



	#relationships
	has_many :orders
	has_many :yummy_tummy_day_orders, :through => :orders


	#scopes

	#number is just another way to group together meals delivered on the same day
	scope :alphabetical, lambda { order('food')}
	scope :by_number, lambda { order('number')}
	scope :for_number, lambda {|number| where( "number = ? ", number) }
	scope :for_date, lambda {|date| where( "date = ? ", date) }

	scope :chronological, lambda { order('date')}
	scope :past, lambda { where('date < ?', Date.today)}
	scope :upcoming, lambda { where('date >= ?', Date.today)}


	#validations
	validates_presence_of :food, :date
  	validates_date :date, :allow_nil => false
  	validates_numericality_of :cost, :only_integer => false, :greater_than => 0


	#methods

	def self.next_meals
		next_date = Date.current.to_date
		num = 0
		meals = []
		Meal.upcoming.chronological.each do |m|
			if num == 0
				meals << m
				next_date = m.date
				num+=1
			else
				if m.date == next_date
					meals << m
				end
			end
		end
		meals
	end

	def meals_ordered  ####### TEST THIS
		orders = Order.for_meal(self.id)
		order_quantities = orders.map{|o| o.quantity}
		unless order_quantities.empty?
			return order_quantities.inject{|sum, i| sum + i}
		else
			return nil
		end
	end




	#callback to calculate number via date??




end
