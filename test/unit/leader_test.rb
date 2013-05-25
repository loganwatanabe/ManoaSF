require 'test_helper'

class LeaderTest < ActiveSupport::TestCase

# Test relationships
  should have_one(:group)
  # should have_many(:participants).through(:groups)
  
  # Test basic validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  # tests for rank
  should allow_value("Office").for(:specialty)

  should allow_value("BZ").for(:nickname)

  should allow_value("Allergic to pineapple").for(:notes)

  should_not allow_value(nil).for(:female)

  
  # tests for phone
  should allow_value("4122683259").for(:phone)
  should allow_value("412-268-3259").for(:phone)
  should allow_value("412.268.3259").for(:phone)
  should allow_value("(412) 268-3259").for(:phone)
  should allow_value(nil).for(:phone)
  should_not allow_value("2683259").for(:phone)
  should_not allow_value("14122683259").for(:phone)
  should_not allow_value("4122683259x224").for(:phone)
  should_not allow_value("800-EAT-FOOD").for(:phone)
  should_not allow_value("412/268/3259").for(:phone)
  should_not allow_value("412-2683-259").for(:phone)

  # test date_of_birth
  should allow_value(29.years.ago.to_date).for(:date_of_birth)
  should allow_value(19.years.ago.to_date).for(:date_of_birth)
  should_not allow_value(14.years.ago.to_date).for(:date_of_birth)
  should_not allow_value(9.years.ago.to_date).for(:date_of_birth)
  should_not allow_value("bad").for(:date_of_birth)
  should_not allow_value(nil).for(:date_of_birth)
  

  context "Creating a leader context" do
	    setup do 
	      create_leader_context
	    end
	    
	    teardown do
	      remove_leader_context
	    end

	    should "allow an existing leader to be edited" do
	    	@logan.nickname = "Logz"
	    	assert @logan.valid?
	    end
	    
	    should "have working name method" do 
	      assert_equal "Watanabe, Logan", @logan.name
	    end
	    
	    should "have working proper_name method" do 
	      assert_equal "Logan Watanabe", @logan.proper_name
	    end

	    should "have working gender method" do 
	      assert_equal "Male", @logan.gender
	      assert_equal "Female", @monica.gender
	    end	    
	    
	    should "have working age method" do 
	      assert_equal 20, @logan.age
	      assert_equal 23, @nick.age
	      assert_equal 29, @bt.age
	    end
	    
	    
	    should "strip non-digits from phone" do 
	      assert_equal "8084977749", @logan.phone
	    end
	    
	    
	    should "have an alphabetical scope" do
	    	assert_equal [@nick, @monica, @jp, @bt, @logan], Leader.alphabetical
	    end


	    should "have a scope to order by age" do
	    	assert_equal [@bt, @monica, @nick, @logan, @jp], Leader.by_age
	    end

	    should "have a scope to get males" do
	    	assert_equal [@nick, @bt, @logan], Leader.males.alphabetical
	    end

	    should "have a scope to order by age" do
	    	assert_equal [@monica, @jp], Leader.females.alphabetical
	    end

	end

end
