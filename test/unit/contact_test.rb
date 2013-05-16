require 'test_helper'

class ContactTest < ActiveSupport::TestCase



	should belong_to(:participant)


	#:first_name, :last_name, :participant_id, :phone_1, :phone_1_type, :phone_2, :phone_2_type, :relation

	  # Test basic validations
	  should validate_presence_of(:first_name)
	  should validate_presence_of(:last_name)
	  should validate_presence_of(:participant_id)
	  should validate_presence_of(:relation)
	  should validate_presence_of(:phone_1)



	  # tests for participant_id
	  should validate_numericality_of(:participant_id)
	  should allow_value(1).for(:participant_id)
	  should_not allow_value(0).for(:participant_id)
	  should_not allow_value(nil).for(:participant_id)
	  should_not allow_value(-1).for(:participant_id)
	  should_not allow_value(3.14).for(:participant_id)
  

	#tests for phone_1 & 2 numbers
	  should allow_value("4122683259").for(:phone_1)
	  should allow_value("412-268-3259").for(:phone_1)
	  should allow_value("412.268.3259").for(:phone_1)
	  should allow_value("(412) 268-3259").for(:phone_1)
	  should_not allow_value(nil).for(:phone_1)
	  should_not allow_value("2683259").for(:phone_1)
	  should_not allow_value("14122683259").for(:phone_1)
	  should_not allow_value("4122683259x224").for(:phone_1)
	  should_not allow_value("800-EAT-FOOD").for(:phone_1)
	  should_not allow_value("412/268/3259").for(:phone_1)
	  should_not allow_value("412-2683-259").for(:phone_1)

	  should allow_value("4122683259").for(:phone_2)
	  should allow_value("412-268-3259").for(:phone_2)
	  should allow_value("412.268.3259").for(:phone_2)
	  should allow_value("(412) 268-3259").for(:phone_2)
	  should allow_value(nil).for(:phone_2)
	  should_not allow_value("2683259").for(:phone_2)
	  should_not allow_value("14122683259").for(:phone_2)
	  should_not allow_value("4122683259x224").for(:phone_2)
	  should_not allow_value("800-EAT-FOOD").for(:phone_2)
	  should_not allow_value("412/268/3259").for(:phone_2)
	  should_not allow_value("412-2683-259").for(:phone_2)

	  #tests for phone_1 & 2 type

  		should allow_value("work").for(:phone_1_type)
  		should allow_value("cell").for(:phone_1_type)
  		should allow_value("home").for(:phone_1_type)
  		should allow_value(nil).for(:phone_1_type)
  		should_not allow_value("home phone").for(:phone_1_type)
  		should_not allow_value("pay phone").for(:phone_1_type)
  		should_not allow_value("none").for(:phone_1_type)

  		should allow_value("work").for(:phone_2_type)
  		should allow_value("cell").for(:phone_2_type)
  		should allow_value("home").for(:phone_2_type)
  		should allow_value(nil).for(:phone_2_type)
  		should_not allow_value("home phone").for(:phone_2_type)
  		should_not allow_value("pay phone").for(:phone_2_type)
  		should_not allow_value("none").for(:phone_2_type)
  

  context "Creating a group context" do
	    setup do 
	      create_leader_context
	      create_group_context
	      create_participant_context
	      create_contact_context
	    end
	    
	    teardown do
	      remove_leader_context
	      remove_group_context
	      remove_participant_context
	      remove_contact_context
	    end

		should "allow an existing contact to be edited" do
	    	@tim_mom.phone_2 = "8082244356"
	    	assert @tim_mom.valid?
	    end
	    
	    should "have working name method" do 
	      assert_equal "Einstein, Wilbur", @annie_dr.name
	    end
	    
	    should "have working proper_name method" do 
	      assert_equal "Wilbur Einstein", @annie_dr.proper_name
	    end


    # @tim_dad = FactoryGirl.create(:contact, participant: @timmy)
    # @tim_mom = FactoryGirl.create(:contact, participant: @timmy, first_name: "Tina", phone_1: "8089882770", phone_2: "8082200134", relation: "Mother")
    # @zach_dad = FactoryGirl.create(:contact, participant: @zach, first_name: "Finn", last_name: "Zoidberg" phone_1: "8086431111", phone_1_type: "cell", phone_2: "8082200134", phone_2_type: "home")
    # @zach_mom = FactoryGirl.create(:contact, participant: @zach, first_name: "Leslie", last_name: "Zoidberg" phone_1: "8084222222", phone_1_type: "work", phone_2: "8082200134", phone_2_type: "home", relation: "Mother")
    # @annie_dr = FactoryGirl.create(:contact, participant: @annie, first_name: "Wilbur", last_name: "Einstein" phone_1: "8085755751", phone_1_type: "work", phone_2: nil, phone_2_type: nil, relation: "Doctor")
    # @eric_aunty = FactoryGirl.create(:contact, participant: @eric, first_name: "Kanani", last_name: "Koleslaw" phone_1: "8084250169", phone_1_type: "cell", phone_2: nil, phone_2_type: nil, relation: "Aunty")









	    should "have a scope to order alphabetically" do
	    	assert_equal [@annie_dr, @eric_aunty, @tim_dad, @tim_mom, @zach_dad, @zach_mom], Contact.alphabetical
	    end

	    should "have a scope to get contacts for a participant" do
	    	assert_equal [@tim_dad, @tim_mom], Contact.for_participant(@timmy).alphabetical
	    end


	end



















end
