require 'test_helper'

class AbsenceTest < ActiveSupport::TestCase


		should belong_to(:participant)




	  # Test basic validations
	  should validate_presence_of(:participant_id)
	  should validate_presence_of(:start_date)
	  should validate_presence_of(:end_date)


	  #test participant id
	  should validate_numericality_of(:participant_id)
	  should allow_value(1).for(:participant_id)
	  should_not allow_value(0).for(:participant_id)
	  should_not allow_value(nil).for(:participant_id)
	  should_not allow_value(-1).for(:participant_id)
	  should_not allow_value(3.14).for(:participant_id)



	  #test start date
	  should allow_value(7.weeks.ago.to_date).for(:start_date)
	  should allow_value(1.day.ago.to_date).for(:start_date)
	  should allow_value(Date.today).for(:start_date)
	  should allow_value(1.week.from_now.to_date).for(:start_date)
	  should_not allow_value("bad").for(:start_date)
	  should_not allow_value(nil).for(:start_date)
  
	  #quick tests for end date
  	  should_not allow_value("bad").for(:end_date)
	  should_not allow_value(nil).for(:end_date)

	  #tests for days gone
	  should validate_numericality_of(:days_gone)
	  should allow_value(1).for(:days_gone)
	  should_not allow_value(0).for(:days_gone)
	  should allow_value(nil).for(:days_gone)
	  should_not allow_value(-1).for(:days_gone)
	  should_not allow_value(3.14).for(:days_gone)

	  #tests for reason
	  should allow_value("Literally anything 654321").for(:reason)



  context "Creating an absence context" do
	    setup do 
	      create_meal_context
	      create_leader_context
	      create_group_context
	      create_participant_context
	      create_absence_context
	    end
	    
	    teardown do
	      remove_meal_context
	      remove_leader_context
	      remove_group_context
	      remove_participant_context
	      remove_absence_context
	    end
	      #   @tim_absence_1 = FactoryGirl.create(:absence, participant: @timmy, start_date: Date.today.to_date, end_date: 5.days.from_now.to_date, days_gone: 4 )
		  #   @tim_absence_2 = FactoryGirl.create(:absence, participant: @timmy, start_date: 2.weeks.from_now.to_date , end_date: 3.weeks.from_now.to_date, days_gone: 7 )
		  #   @gina_absence = FactoryGirl.create(:absence, participant: @gina, start_date: Date.today.to_date, end_date: 2.weeks.from_now.to_date, days_gone: nil)
		  #   @zach_absence = FactoryGirl.create(:absence, participant: @zach, start_date: 1.day.from_now.to_date, end_date: 1.day.from_now.to_date, days_gone: 1 )
		  #   @annie_absence = FactoryGirl.create(:absence, participant: @annie, start_date: 2.days.ago.to_date, end_date: 2.days.from_now.to_date, days_gone:  4)

		should "have a scope to order absences chronologically" do
	    	assert_equal [@annie_absence, @tim_absence_1, @gina_absence, @zach_absence, @tim_absence_2], Absence.chronological
	    end

		should "have a scope to get absences for a participant" do
			assert_equal [@tim_absence_1, @tim_absence_2], Absence.for_participant(@timmy).chronological
			assert_equal [@zach_absence], Absence.for_participant(@zach).chronological
	    	
	    end    	    

	end
end
