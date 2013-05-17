require 'test_helper'

class GroupTest < ActiveSupport::TestCase

	should have_many(:participants)
	should belong_to(:leader)
	should have_many(:yummy_tummy_day_orders).through(:participants)
  
  # Test basic validations
  should validate_presence_of(:number)

  # tests for leader_id
  should validate_numericality_of(:leader_id)
  should allow_value(1).for(:leader_id)
  should allow_value(nil).for(:leader_id)
  should_not allow_value(0).for(:leader_id)
  should_not allow_value(-1).for(:leader_id)
  should_not allow_value(3.14).for(:leader_id)
  
    # tests for number
  should validate_numericality_of(:number)
  should allow_value(1).for(:number)
  should allow_value(0).for(:number)
  should_not allow_value(nil).for(:number)
  should_not allow_value(-1).for(:number)
  should_not allow_value(3.14).for(:number)


    # tests for rotation
  should validate_numericality_of(:rotation)
  should allow_value(1).for(:rotation)
  should allow_value(2).for(:rotation)
  should allow_value(3).for(:rotation)
  should_not allow_value(0).for(:rotation)
  should_not allow_value(nil).for(:rotation)
  should_not allow_value(-1).for(:rotation)
  should_not allow_value(3.14).for(:rotation)

  # tests for homeroom
  should allow_value("MPB").for(:homeroom)
  should allow_value("Ewa New Gym").for(:homeroom)

  # test min/max age
  should validate_numericality_of(:min_age)
  should allow_value(3).for(:min_age)
  should allow_value(7).for(:min_age)
  should allow_value(10).for(:min_age)
  should allow_value(12).for(:min_age)
  should_not allow_value(0).for(:min_age)
  should_not allow_value(1).for(:min_age)
  should_not allow_value(-1).for(:min_age)
  should_not allow_value(3.14159).for(:min_age)
  should allow_value(nil).for(:min_age)
  
  # limited tests for max_age
  should validate_numericality_of(:max_age)
  should allow_value(nil).for(:max_age)

    # test min/max age
  should validate_numericality_of(:min_grade)
  should allow_value(0).for(:min_grade)
  should allow_value(1).for(:min_grade)
  should allow_value(3).for(:min_grade)
  should allow_value(6).for(:min_grade)
  should_not allow_value(-1).for(:min_grade)
  should_not allow_value(3.14159).for(:min_grade)
  should allow_value(nil).for(:min_grade)
  
  # limited tests for max_grade
  should validate_numericality_of(:max_grade)
  should allow_value(nil).for(:max_grade)
  

  context "Creating a group context" do
	    setup do 
	      create_leader_context
	      create_group_context
	    end
	    
	    teardown do
	      remove_leader_context
	      remove_group_context
	    end

	    should "allow an existing leader to be edited" do
	    	@group1.homeroom = "Pool Pavillion"
	    	assert @group1.valid?
	    end
	    
	    should "have a scope to order by number" do
	    	assert_equal [@group1, @group2, @group3, @group4, @group5], Group.by_number
	    end


	    should "have a scope to get group for rotation" do
	    	assert_equal [@group1, @group2], Group.for_rotation(1).by_number
	    	assert_equal [@group3, @group4], Group.for_rotation(2).by_number
	    	assert_equal [@group5], Group.for_rotation(3)
	    end

	end









end
