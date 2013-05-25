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

  		should allow_value("work").for(:type)
  		should allow_value("cell").for(:type)
  		should allow_value("home").for(:type)
  		should allow_value(nil).for(:type)
  		should_not allow_value("home phone").for(:type)
  		should_not allow_value("pay phone").for(:type)
  		should_not allow_value("none").for(:type)
  

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


	end
end
