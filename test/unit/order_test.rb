require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  

	#test relationships
	should belong_to(:yummy_tummy_day_order)
	should have_one(:participant).through(:yummy_tummy_day_order)
	should belong_to(:meal)


	#basic validations

	should validate_presence_of(:meal_id)
	should validate_presence_of(:yummy_tummy_day_order_id)
	should validate_presence_of(:quantity)



	#yummy tummy id
	  should validate_numericality_of(:yummy_tummy_day_order_id)
	  should allow_value(1).for(:yummy_tummy_day_order_id)
	  should_not allow_value(0).for(:yummy_tummy_day_order_id)
	  should_not allow_value(nil).for(:yummy_tummy_day_order_id)
	  should_not allow_value(-1).for(:yummy_tummy_day_order_id)
	  should_not allow_value(3.14).for(:yummy_tummy_day_order_id)


	#meal id
	  should validate_numericality_of(:meal_id)
	  should allow_value(1).for(:meal_id)
	  should_not allow_value(0).for(:meal_id)
	  should_not allow_value(nil).for(:meal_id)
	  should_not allow_value(-1).for(:meal_id)
	  should_not allow_value(3.14).for(:meal_id)



	#delivered
	  should allow_value(nil).for(:delivered)
	  should allow_value(true).for(:delivered)
	  should allow_value(false).for(:delivered)



	#quantity
	  should validate_numericality_of(:quantity)
	  should allow_value(1).for(:quantity)
	  should allow_value(2).for(:quantity)
	  should_not allow_value(0).for(:quantity)
	  should_not allow_value(nil).for(:quantity)
	  should_not allow_value(-1).for(:quantity)
	  should_not allow_value(3.14).for(:quantity)


 context "Creating a order context" do
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

		should "allow a order to be edited" do
			@zach_nuggets.quantity = 2
			assert @zach_nuggets.valid?	
	    end

	   # @tim_apple = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @apples, quantity: 1, delivered: true)
    # @tim_burger = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @mcdonalds_burger , quantity: 1)
    # @tim_spam = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @musubi_spam , quantity: 1)
    # @tim_cheese = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @pizza_cheese , quantity: 1)
    # @tim_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @chicken , quantity: 1)
    # @annie_apple = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @apples , quantity: 1, delivered: true)
    # @annie_nuggets = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @mcdonalds_nuggets , quantity: 1)
    # @annie_chicken_mus = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @musubi_chicken , quantity: 2)
    # @annie_supreme = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @pizza_supreme , quantity: 1)
    # @annie_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @chicken , quantity: 1)
    # @eric_apple = FactoryGirl.create(:order, yummy_tummy_day_order: @eric_ytd , meal: @apples , quantity: 2, delivered: false)
    # @eric_nuggets = FactoryGirl.create(:order, yummy_tummy_day_order: @eric_ytd , meal: @mcdonalds_nuggets , quantity: 1)
    # @eric_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @eric_ytd , meal: @chicken , quantity: 1)
    # @zach_apple = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @apples , quantity: 2, delivered: false)
    # @zach_nuggets = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @mcdonalds_nuggets , quantity: 1)
    # @zach_burger = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @mcdonalds_burger , quantity: 1)
    # @zach_spam = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @musubi_spam , quantity: 1)
    # @zach_chicken_mus = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @musubi_chicken , quantity: 1)
    # @zach_cheese = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @pizza_cheese , quantity: 1)
    # @zach_supreme = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @pizza_supreme , quantity: 1)
    # @zach_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @chicken , quantity: 2)
    # @gina_spam = FactoryGirl.create(:order, yummy_tummy_day_order: @gina_ytd , meal: @musubi_spam , quantity: 1)
    # @gina_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @gina_ytd , meal: @chicken , quantity: 1)
    # @gina_supreme = FactoryGirl.create(:order, yummy_tummy_day_order: @gina_ytd , meal: @pizza_supreme , quantity: 1)

    should "have a scope to sort orders alphabetically by participant" do
    	assert_equal ["Anderson", "Anderson", "Anderson", "Anderson", "Anderson", "Ernie", "Ernie", "Ernie", "Goldberg", "Goldberg", "Goldberg", "Toddler", "Toddler", "Toddler", "Toddler", "Toddler", "Zoidberg", "Zoidberg", "Zoidberg", "Zoidberg", "Zoidberg", "Zoidberg", "Zoidberg", "Zoidberg"], Order.by_participant.map{|o| o.yummy_tummy_day_order.participant.last_name}
    end

    should "have a scope to sort orders by meal number" do
    	assert_equal [1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6, 6, 6, 9, 9, 9, 10, 10], Order.by_number.map{|o| o.meal.number}
    end

    should "have a scope to sort orders alphabetically by food" do
    	assert_equal ["Apples", "Apples", "Apples", "Apples", "Cheese Pizza", "Cheese Pizza", "Chicken", "Chicken", "Chicken", "Chicken", "Chicken", "Chicken Musubi", "Chicken Musubi", "Chicken Nuggets", "Chicken Nuggets", "Chicken Nuggets", "Hamburger", "Hamburger", "Spam Musubi", "Spam Musubi", "Spam Musubi", "Supreme Pizza", "Supreme Pizza", "Supreme Pizza"], Order.by_food.map{|o| o.meal.food}
    end

    should "have a scope to get orders for a ytd" do
    	assert_equal [@tim_apple, @tim_cheese, @tim_burger, @tim_chicken, @tim_spam], Order.for_ytd(@tim_ytd).by_number
    end

    should "have a scope to get orders not delivered" do
    	assert_equal [@eric_apple, @zach_apple], Order.not_delivered.by_participant
    end

    should "have a scope to get orders that have been delivered" do
    	assert_equal [@annie_apple, @tim_apple], Order.was_delivered.by_participant
    end

    should "have a scope to get orders for a meal" do
    	assert_equal [@annie_apple, @eric_apple, @tim_apple, @zach_apple], Order.for_meal(@apples).by_participant
    end

    should "have a scope to get orders by date" do
    	assert_equal ["Apples", "Apples", "Apples", "Apples", "Cheese Pizza", "Cheese Pizza", "Supreme Pizza", "Supreme Pizza", "Supreme Pizza", "Chicken Nuggets", "Chicken Nuggets", "Chicken Nuggets", "Hamburger", "Hamburger", "Chicken", "Chicken", "Chicken", "Chicken", "Chicken", "Chicken Musubi", "Chicken Musubi", "Spam Musubi", "Spam Musubi", "Spam Musubi"], Order.by_date.by_food.map{|o| o.meal.food}
    end


	# # validate :upcoming_meals_not_delivered
	# should "validate that meals are not delivered before their date" do
	# 	bad_order = FactoryGirl.build(:order, yummy_tummy_day_order: @gina_ytd, meal: @subway_ham, quantity: 1, delivered: true)
	# 	deny bad_order.valid?, "#{bad_order.to_yaml}"
	# end


	# def cost
	should "have a method to get the cost of an order" do
		assert_equal 4.00, @tim_spam.cost
		assert_equal 9.00, @zach_chicken.cost
		assert_equal 5.00, @eric_apple.cost

	end




  end



end
