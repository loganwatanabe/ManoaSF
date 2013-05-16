require 'test_helper'

class YummyTummyDayOrderTest < ActiveSupport::TestCase

	should have_many(:orders)
	should have_many(:yummy_tummy_day_orders).through(:orders)



	  # Test basic validations
	  should validate_presence_of(:food)


	  #test date
	  should allow_value(2.days.ago.to_date).for(:date)
	  should allow_value(2.days.from_now.to_date).for(:date)
	  should allow_value(Date.current.to_date).for(:date)
	  should_not allow_value(0).for(:date)
	  should_not allow_value("bad").for(:date)
	  should_not allow_value(nil).for(:date)



	  #test cost
	  should validate_numericality_of(:cost)
	  should allow_value(1).for(:cost)
	  should allow_value(4.50).for(:cost)
	  should allow_value(3.14).for(:cost)
	  should allow_value(6.25).for(:cost)
	  should_not allow_value(0).for(:cost)
	  should_not allow_value(nil).for(:cost)
	  should_not allow_value(-1).for(:cost)
  

  context "Creating a meal context" do
	    setup do 
	      create_meal_context
	    end
	    
	    teardown do
	      remove_meal_context
	    end

		should "allow an existing meal to be edited" do
	    	@chicken.cost = 4.75
	    	assert @chicken.valid?
	    end
	    

    # @pizza_cheese = FactoryGirl.create(:meal, food: "Cheese Pizza", cost: 5.00, date: 1.week.from_now.to_date, number: 1)
    # @pizza_supreme = FactoryGirl.create(:meal, food: "Supreme Pizza", cost: 5.00, date: 1.week.from_now.to_date, number: 1)
    # @mcdonalds_nuggets = FactoryGirl.create(:meal, food: "Chicken Nuggets", cost: 5.00, date: 2.weeks.from_now.to_date, number: 2)
    # @mcdonalds_burger = FactoryGirl.create(:meal, food: "Hamburger", cost: 5.00, date: 2.weeks.from_now.to_date, number: 2)
    # @chicken = FactoryGirl.create(:meal, food: "Chicken", cost: 4.50, date: 3.weeks.from_now.to_date, number: 3)
    # @subway_turkey = FactoryGirl.create(:meal, food: "Turkey Subway", cost: 5.00, date: 5.weeks.from_now.to_date, number: 4)
    # @subway_ham = FactoryGirl.create(:meal, food: "Ham Subway", cost: 5.00, date: 5.weeks.from_now.to_date, number: 4)
    # @musubi_spam = FactoryGirl.create(:meal, food: "Spam Musubi", cost: 4.00, date: 6.weeks.from_now.to_date, number: 5)
    # @musubi_chicken = FactoryGirl.create(:meal, food: "Chicken Musubi", cost: 4.00, date: 6.weeks.from_now.to_date, number: 5)


	# : alphabetical, :by_number,  :for_number,  :for_date,  :chronological,  :past,  :upcoming,  :next,     

		should "have a scope to order alphabetically" do
	    	assert_equal ["Apples", "Cheese Pizza", "Chicken", "Chicken Musubi", "Chicken Nuggets", "Ham Subway","Hamburger", "Spam Musubi", "Supreme Pizza", "Turkey Subway"], Meal.alphabetical.map{|m| m.food}
	    end


	end
end
