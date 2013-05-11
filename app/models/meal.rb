class Meal < ActiveRecord::Base
  attr_accessible :cost, :date, :food, :number



	#callbacks



	#relationships
	has_many :orders
	has_many :yummy_tummy_day_orders, :through => :orders


	#scopes

	#number is just another way to group together meals delivered on the same day
	scope :by_number, order('number')
	scope :for_number, lambda {|number| where( "number = ? ", number) }
	scope :for_date, lambda {|date| where( "date = ? ", date) }

	scope :chronological, order('date')
	scope :past, where('date < ?', Date.today)
	scope :upcoming, where('date >= ?', Date.today)
	scope :next, lambda {|num| limit(num) }


	#validations
	validates_presence_of :food
  	validates_date :date
  	validates_numericality_of :cost, :only_integer => false, :greater_than => 0


	#methods




end
