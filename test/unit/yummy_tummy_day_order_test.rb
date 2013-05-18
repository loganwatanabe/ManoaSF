require 'test_helper'

class YummyTummyDayOrderTest < ActiveSupport::TestCase

	should belong_to(:participant)
	should have_many(:orders)
	should have_many(:meals).through(:orders)



	  # Test basic validations
	  should validate_presence_of(:participant_id)


	  #test date
	  should validate_numericality_of(:participant_id)
	  should allow_value(1).for(:participant_id)
	  should_not allow_value(0).for(:participant_id)
	  should_not allow_value(nil).for(:participant_id)
	  should_not allow_value(-1).for(:participant_id)
	  should_not allow_value(3.14).for(:participant_id)



	  #test cost
	  should validate_numericality_of(:total_cost)
	  should allow_value(1).for(:total_cost)
	  should allow_value(4.50).for(:total_cost)
	  should allow_value(3.14).for(:total_cost)
	  should allow_value(6.25).for(:total_cost)
	  should allow_value(nil).for(:total_cost)
	  should_not allow_value(0).for(:total_cost)
	  should_not allow_value(-1).for(:total_cost)
  

  context "Creating a yummy tummy context" do
	    setup do 
	      create_meal_context
	      create_leader_context
	      create_group_context
	      create_participant_context
	      create_yummy_tummy_day_order_context
	      create_order_context
	    end
	    
	    teardown do
	      remove_meal_context
	      remove_leader_context
	      remove_group_context
	      remove_participant_context
	      remove_yummy_tummy_day_order_context
	      remove_order_context
	    end

		should "calculate total cost on update" do
			#change this when you put in orders
	    	# assert_equal nil, @tim_ytd.total_cost
	    end
	    
	# scope :for_participant, lambda {|participant_id| where("participant_id = ?", participant_id) }
	# scope :for_group, lambda {|group_id| joins(:participant).where("participant.group_id = ?", group_id) }
	# scope :children_orders, joins(:participant).where("participant.role = ? ", "child")
	# scope :junior_orders, joins(:participant).where("participant.role = ? ", "junior")

	   #  @tim_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @timmy)
    # @annie_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @annie)
    # @eric_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @eric)
    # @zach_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @zach)
    # @gina_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @gina)

		should "have a scope to order YTDs by participant name" do
	    	assert_equal [@annie_ytd, @eric_ytd, @gina_ytd, @tim_ytd, @zach_ytd], YummyTummyDayOrder.alphabetical
	    end    


		should "have a scope to get YTDs for a participant" do
	    	assert_equal [@tim_ytd], YummyTummyDayOrder.for_participant(@timmy)
	    end

	    should "have a scope to get YTDs for a group" do
	    	assert_equal [@gina_ytd, @tim_ytd], YummyTummyDayOrder.for_group(@group3).alphabetical
	    	assert_equal [@zach_ytd], YummyTummyDayOrder.for_group(@group1).alphabetical
	    end

	    should "have a scope to get only YTDs for children" do
	    	assert_equal [@annie_ytd, @eric_ytd, @tim_ytd], YummyTummyDayOrder.children_orders.alphabetical
	    end

	    should "have a scope to get only YTDs for junior leaders" do
	    	assert_equal [@gina_ytd, @zach_ytd], YummyTummyDayOrder.junior_orders.alphabetical
	    end


	    #method tests
	    #need orders for this
	    should "have a method to get meals for an order" do
	    	assert_equal ["Apples", "Cheese Pizza", "Chicken", "Hamburger", "Spam Musubi"], @tim_ytd.get_meals.map{|m| m.food}.sort!
	    	assert_equal ["Apples", "Chicken", "Chicken Nuggets"], @eric_ytd.get_meals.map{|m| m.food}.sort!
	    	assert_equal ["Apples", "Cheese Pizza", "Chicken", "Chicken Musubi", "Chicken Nuggets", "Hamburger", "Spam Musubi", "Supreme Pizza"], @zach_ytd.get_meals.map{|m| m.food}.sort!

	    end

	    should "have a method to get quantity of a meal" do
	    	assert_equal 1, @tim_ytd.quantity_for_meal(@apples)
	    	assert_equal 0, @tim_ytd.quantity_for_meal(@subway_ham)
	    	assert_equal 2, @zach_ytd.quantity_for_meal(@apples)
	    	
	    end

	    should "have a method to get total cost of a YTD" do
	    	assert_equal 21.00, @tim_ytd.calculate_total_cost
	    	assert_equal 25.00, @annie_ytd.calculate_total_cost
	    	assert_equal 14.50, @eric_ytd.calculate_total_cost
	    	assert_equal 13.50, @gina_ytd.calculate_total_cost
	    	assert_equal 42.00, @zach_ytd.calculate_total_cost
	    end


	end
end
