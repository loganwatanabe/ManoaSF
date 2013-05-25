require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

	#:date_of_birth, :first_name, :grade, :group_id, :last_name, :nickname, :notes, :role
	should belong_to(:group)
	should have_many(:contacts)
	should have_many(:phone_numbers).through(:contacts)
	should have_many(:absences)
	should have_one(:yummy_tummy_day_order)
	should have_many(:orders).through(:yummy_tummy_day_order)

  # Test basic validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:group_id)
  should validate_presence_of(:role)



  # tests for group_id
  should validate_numericality_of(:group_id)
  should allow_value(1).for(:group_id)
  should_not allow_value(0).for(:group_id)
  should_not allow_value(nil).for(:group_id)
  should_not allow_value(-1).for(:group_id)
  should_not allow_value(3.14).for(:group_id)
  
    # tests for number
  should validate_numericality_of(:grade)
  should allow_value(1).for(:grade)
  should allow_value(0).for(:grade)
  should_not allow_value(nil).for(:grade)
  should_not allow_value(-1).for(:grade)
  should_not allow_value(3.14).for(:grade)
  should_not allow_value(14).for(:grade)

  # tests for date_of_birth
  should allow_value(29.years.ago.to_date).for(:date_of_birth)
  should allow_value(19.years.ago.to_date).for(:date_of_birth)
  should allow_value(14.years.ago.to_date).for(:date_of_birth)
  should allow_value(9.years.ago.to_date).for(:date_of_birth)
  should allow_value(5.years.ago.to_date).for(:date_of_birth)
  should_not allow_value(1.year.ago.to_date).for(:date_of_birth)
  should_not allow_value(0).for(:date_of_birth)
  should_not allow_value("bad").for(:date_of_birth)
  should_not allow_value(nil).for(:date_of_birth)
  

    # tests for role
  should allow_value("child").for(:role)
  should allow_value("junior").for(:role)
  should_not allow_value("junior leader").for(:role)
  should_not allow_value(nil).for(:role)
  should_not allow_value("leader").for(:role)
  should_not allow_value("volunteer").for(:role)

      # tests for female
  should_not allow_value(nil).for(:female)



  

  context "Creating a group context" do
	    setup do 
	      create_leader_context
	      create_group_context
	      create_participant_context
	    end
	    
	    teardown do
	      remove_leader_context
	      remove_group_context
	      remove_participant_context
	    end

	   #  #children
    # @timmy = FactoryGirl.create(:participant, group: @group3)
    # @adam = FactoryGirl.create(:participant, first_name: "Adam", last_name: "Adamson", date_of_birth: 5.years.ago.to_date, grade: 0, group: @group1)
    # @annie = FactoryGirl.create(:participant, first_name: "Annie", last_name: "Anderson", date_of_birth: 7.years.ago.to_date, grade: 1, group: @group2)
    # @benny = FactoryGirl.create(:participant, first_name: "Benny", last_name: "Benson", nickname: "Ben", date_of_birth: 8.years.ago.to_date, grade: 2, group: @group2)
    # @betty = FactoryGirl.create(:participant, first_name: "Betty", last_name: "Bettle", date_of_birth: 10.years.ago.to_date, grade: 3, group: @group3)
    # @eric = FactoryGirl.create(:participant, first_name: "Eric", last_name: "Ernie", date_of_birth: 10.years.ago.to_date, grade: 5, group: @group4)

    # #junior leaders
    # @zach = FactoryGirl.create(:participant, role: 'junior', first_name: "Zach", last_name: "Zoidberg", date_of_birth: 15.years.ago.to_date, grade: 10, group: @group1)
    # @yi = FactoryGirl.create(:participant, role: 'junior', first_name: "Yi", last_name: "Young", nickname: "Jack", date_of_birth: 13.years.ago.to_date, grade: 9, group: @group2)
    # @gina = FactoryGirl.create(:participant, role: 'junior', first_name: "Gina", last_name: "Goldberg", date_of_birth: 12.years.ago.to_date, grade: 7, group: @group3)
    # @sam = FactoryGirl.create(:participant, role: 'junior', first_name: "Sam", last_name: "Sampson", date_of_birth: 16.years.ago.to_date, grade: 10, group: @group4)
    # @oren = FactoryGirl.create(:participant, role: 'junior', first_name: "Oren", last_name: "Ogletree", date_of_birth: 18.years.ago.to_date, grade: 11, group: @group5)



		should "allow an existing leader to be edited" do
	    	@timmy.nickname = "Tim"
	    	assert @timmy.valid?
	    end
	    
	    should "have working name method" do 
	      assert_equal "Benson, Benny", @benny.name
	    end
	    
	    should "have working proper_name method" do 
	      assert_equal "Benny Benson", @benny.proper_name
	    end
	    
	    should "have working age method" do 
	      assert_equal 5, @adam.age
	      assert_equal 10, @betty.age
	      assert_equal 16, @sam.age
	    end


	   	should "have working role? method" do 
	      assert_equal true, @adam.role?(:child)
	      assert_equal true, @betty.role?(:child)
	      assert_equal false, @sam.role?(:child)
	      assert_equal true, @sam.role?(:junior)
	    end


	   	should "have working child? method" do 
	      assert_equal true, @adam.child?
	      assert_equal true, @betty.child?
	      assert_equal false, @sam.child?
	    end

	   	should "have working junior? method" do 
	      assert_equal false, @adam.junior?
	      assert_equal false, @betty.junior?
	      assert_equal true, @sam.junior?
	    end

	    should "have working gender method" do 
	      assert_equal "Male", @adam.gender
	      assert_equal "Female", @betty.gender
	      assert_equal "Male", @sam.gender
	    end

	 	# :alphabetical
		# :by_group
		# :for_group
		# :by_age
		# :by_grade
		# :for_grade
		# :children
		# :juniors

# @timmy = age 11, grade 4, group 3
    # @adam =  5.years.ago.to_date, grade: 0, group: @group1)
    # @annie = 7.years.ago.to_date, grade: 1, group: @group2)
    # @benny = 8.years.ago.to_date, grade: 2, group: @group2)
    # @betty = 10.years.ago.to_date, grade: 3, group: @group3)
    # @eric = 10.years.ago.to_date, grade: 5, group: @group4)

    # #junior leaders
    # @zach =  15.years.ago.to_date, grade: 10, group: @group1)
    # @yi = date_of_birth: 13.years.ago.to_date, grade: 9, group: @group2)
    # @gina = date_of_birth: 12.years.ago.to_date, grade: 7, group: @group3)
    # @sam =  date_of_birth: 16.years.ago.to_date, grade: 10, group: @group4)
    # @oren = date_of_birth: 18.years.ago.to_date, grade: 11, group: @group5)

	    should "have a scope to order alphabetically" do
	    	assert_equal [@adam, @annie, @benny, @betty, @eric, @gina, @oren, @sam, @timmy, @yi, @zach], Participant.alphabetical
	    end

	    should "have a scope to order by group" do
	    	assert_equal ["Adam", "Zach", "Annie", "Benny", "Yi", "Betty", "Gina", "Timmy", "Eric", "Sam", "Oren"], Participant.by_group.alphabetical.map {|p| p.first_name }
	    end


	    should "have a scope to get participants for a group" do
	    	assert_equal [@adam, @zach], Participant.for_group(@group1).alphabetical
	    	assert_equal [@annie, @benny, @yi], Participant.for_group(@group2).alphabetical
	    	assert_equal [@betty, @gina, @timmy], Participant.for_group(@group3).alphabetical
	    	assert_equal [@eric, @sam], Participant.for_group(@group4).alphabetical
	    	assert_equal [@oren], Participant.for_group(@office).alphabetical
	    end

	    should "have a scope to order alphabetically" do
	    	assert_equal [@adam, @benny, @eric, @oren, @sam, @timmy, @yi, @zach], Participant.males.alphabetical
	    	assert_equal [@annie, @betty, @gina], Participant.females.alphabetical
	    end



	    should "have a scope to order by age" do
	    	assert_equal ["Oren", "Sam", "Zach", "Yi", "Gina", "Timmy", "Betty", "Eric", "Benny", "Annie", "Adam"], Participant.by_age.alphabetical.map {|p| p.first_name }
	    end

	    should "have a scope to order by grade" do
	    	assert_equal ["Adam", "Annie", "Benny", "Betty", "Timmy", "Eric", "Gina", "Yi", "Sam", "Zach", "Oren"], Participant.by_grade.alphabetical.map {|p| p.first_name }
	    end

	    should "have a scope to get participants for a grade" do
	    	assert_equal [@adam], Participant.for_grade(0).alphabetical
	    	assert_equal [], Participant.for_grade(6).alphabetical
	    	assert_equal [@sam, @zach], Participant.for_grade(10).alphabetical
	    	assert_equal [@oren], Participant.for_grade(11).alphabetical
	    end

	    should "have a scope to get children only" do
	    	assert_equal [@adam, @annie, @benny, @betty, @eric, @timmy], Participant.children.alphabetical
	    end

	    should "have a scope to order by age" do
	    	assert_equal [@gina, @oren, @sam, @yi, @zach], Participant.juniors.alphabetical
	    end

	end


end
