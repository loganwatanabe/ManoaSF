require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase

	  should belong_to(:contact)


	  # Test basic validations
	  should validate_presence_of(:phone)
	  should validate_presence_of(:contact_id)



	  # tests for participant_id
	  should validate_numericality_of(:contact_id)
	  should allow_value(1).for(:contact_id)
	  should_not allow_value(0).for(:contact_id)
	  should_not allow_value(nil).for(:contact_id)
	  should_not allow_value(-1).for(:contact_id)
	  should_not allow_value(3.14).for(:contact_id)
  

	#tests for phone
	  should allow_value("4122683259").for(:phone)
	  should allow_value("412-268-3259").for(:phone)
	  should allow_value("412.268.3259").for(:phone)
	  should allow_value("(412) 268-3259").for(:phone)
	  should_not allow_value(nil).for(:phone)
	  should_not allow_value("2683259").for(:phone)
	  should_not allow_value("14122683259").for(:phone)
	  should_not allow_value("4122683259x224").for(:phone)
	  should_not allow_value("800-EAT-FOOD").for(:phone)
	  should_not allow_value("412/268/3259").for(:phone)
	  should_not allow_value("412-2683-259").for(:phone)

	  #tests for phone type

  		should allow_value("work").for(:phone_type)
  		should allow_value("cell").for(:phone_type)
  		should allow_value("home").for(:phone_type)
  		should allow_value(nil).for(:phone_type)
  		should_not allow_value("home phone").for(:phone_type)
  		should_not allow_value("pay phone").for(:phone_type)
  		should_not allow_value("none").for(:phone_type)
  

  context "Creating a phone context" do
	    setup do 
	      create_leader_context
	      create_group_context
	      create_participant_context
	      create_contact_context
	      create_phone_number_context
	    end
	    
	    teardown do
	      remove_leader_context
	      remove_group_context
	      remove_participant_context
	      remove_contact_context
	      remove_phone_number_context
	    end
	    # @tim_dad_1 = FactoryGirl.create(:phone_number, contact: @tim_dad, phone: "8089882002", type: "cell")
	    # @tim_mom_1 = FactoryGirl.create(:phone_number, contact: @tim_mom, phone: "8089882770", type: "home")
	    # @tim_mom_2 = FactoryGirl.create(:phone_number, contact: @tim_mom, phone: "8082200134", type: "cell")
	    # @zach_dad_1 = FactoryGirl.create(:phone_number, contact: @zach_dad, phone: "8083457777", type: "cell")
	    # @zach_dad_2 = FactoryGirl.create(:phone_number, contact: @zach_dad, phone: "8082209834", type: "home")
	    # @zach_mom_1 = FactoryGirl.create(:phone_number, contact: @zach_mom, phone: "8083466677", type: "work")
	    # @zach_mom_2 = FactoryGirl.create(:phone_number, contact: @zach_mom, phone: "8089881234", type: "home")
	    # @annie_dr_1 = FactoryGirl.create(:phone_number, contact: @annie_dr, phone: "8087443174", type: "work")
	    # @eric_aunty_1 = FactoryGirl.create(:phone_number, contact: @eric_aunty, phone: "8089876546", type: "cell")

	    should "have a scope to order phone numbers by type" do
	    	assert_equal ["cell", "cell", "cell", "cell", "home", "home", "home", "work", "work"], PhoneNumber.by_type.map{|p| p.phone_type}
	    end

	    should "have a scope to get phone numbers for a contact" do
	    	assert_equal [@tim_mom_2, @tim_mom_1], PhoneNumber.for_contact(@tim_mom).by_type
	    	assert_equal [@zach_mom_2, @zach_mom_1], PhoneNumber.for_contact(@zach_mom).by_type
	    	assert_equal [@eric_aunty_1], PhoneNumber.for_contact(@eric_aunty).by_type
	    end


	    should "have a scope to get phone numbers for a participant" do
	    	assert_equal ["8089882002", "8082200134", "8089882770" ], PhoneNumber.for_participant(@timmy).by_type.map{|p| p.phone}
	    	assert_equal ["8087443174"], PhoneNumber.for_participant(@annie).by_type.map{|p| p.phone}
	    end

	    should "have a scope to get phone numbers for a phone type" do
	    	assert_equal ["cell", "cell", "cell", "cell"], PhoneNumber.for_type("cell").map{|p| p.phone_type}
	    	assert_equal ["home", "home", "home"], PhoneNumber.for_type("home").map{|p| p.phone_type}
	    	assert_equal ["work", "work"], PhoneNumber.for_type("work").map{|p| p.phone_type}

	    end


	end
end
