require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Prof. H's deny method to improve readability of tests
  def deny(condition, msg="")
    # a simple transformation to increase readability IMO
    assert !condition, msg
  end
 
   # Context for leaders
  def create_leader_context
    @logan = FactoryGirl.create(:leader)
    @nick = FactoryGirl.create(:leader, first_name: "Nick", last_name: "Deng", date_of_birth: 23.years.ago.to_date, specialty: "Music", phone: "8081234567")
    @monica = FactoryGirl.create(:leader, first_name: "Monica", last_name: "Foolsey", date_of_birth: 26.years.ago.to_date, specialty: "Arts & Crafts", phone: "8085550011")
    @bt = FactoryGirl.create(:leader, first_name: "Bryce", last_name: "Tomato", nickname: "BT", date_of_birth: 29.years.ago.to_date, specialty: "Fitness", phone: "8081116969")
    @jp = FactoryGirl.create(:leader, first_name: "Justin", last_name: "Perrigo", nickname: "JP", date_of_birth: 18.years.ago.to_date, specialty: "Sports & Games", phone: "8086431111")
  end
  
  def remove_leader_context
    @logan.destroy
    @nick.destroy
    @monica.destroy
    @bt.destroy
    @jp.destroy
  end

    # Context for group
  def create_group_context
    @group1=FactoryGirl.create(:group, :number => 1, :leader => @monica)
    @group4=FactoryGirl.create(:group, :number => 4, :leader => @logan, :rotation => 2)
    @group2=FactoryGirl.create(:group, :number => 2, :leader => @jp)
    @group5=FactoryGirl.create(:group, :number => 5, :leader => @nick, :rotation => 3)
    @group3=FactoryGirl.create(:group, :number => 3, :leader => @bt, :rotation => 2)

  end
  
  def remove_group_context
    @group1.destroy
    @group2.destroy
    @group3.destroy
    @group4.destroy
    @group5.destroy
  end


  # Context for participants
  def create_participant_context
    #children
    @timmy = FactoryGirl.create(:participant, group: @group3)
    @adam = FactoryGirl.create(:participant, first_name: "Adam", last_name: "Adamson", date_of_birth: 5.years.ago.to_date, grade: 0, group: @group1)
    @betty = FactoryGirl.create(:participant, first_name: "Betty", last_name: "Bettle", date_of_birth: 10.years.ago.to_date, grade: 3, group: @group3)
    @eric = FactoryGirl.create(:participant, first_name: "Eric", last_name: "Ernie", date_of_birth: 10.years.ago.to_date, grade: 5, group: @group4)
    @annie = FactoryGirl.create(:participant, first_name: "Annie", last_name: "Anderson", date_of_birth: 7.years.ago.to_date, grade: 1, group: @group2)
    @benny = FactoryGirl.create(:participant, first_name: "Benny", last_name: "Benson", nickname: "Ben", date_of_birth: 8.years.ago.to_date, grade: 2, group: @group2)

    #junior leaders
    @yi = FactoryGirl.create(:participant, role: 'junior', first_name: "Yi", last_name: "Young", nickname: "Jack", date_of_birth: 13.years.ago.to_date, grade: 9, group: @group2)
    @gina = FactoryGirl.create(:participant, role: 'junior', first_name: "Gina", last_name: "Goldberg", date_of_birth: 12.years.ago.to_date, grade: 7, group: @group3)
    @zach = FactoryGirl.create(:participant, role: 'junior', first_name: "Zach", last_name: "Zoidberg", date_of_birth: 15.years.ago.to_date, grade: 10, group: @group1)
    @sam = FactoryGirl.create(:participant, role: 'junior', first_name: "Sam", last_name: "Sampson", date_of_birth: 16.years.ago.to_date, grade: 10, group: @group4)
    @oren = FactoryGirl.create(:participant, role: 'junior', first_name: "Oren", last_name: "Ogletree", date_of_birth: 18.years.ago.to_date, grade: 11, group: @group5)



  end
  
  def remove_participant_context
    #children
    @timmy.destroy
    @adam.destroy
    @annie.destroy
    @benny.destroy
    @betty.destroy
    @eric.destroy

    #junior leaders
    @zach.destroy
    @yi.destroy
    @gina.destroy
    @sam.destroy
    @oren.destroy
  end

      # Context for contact
  def create_contact_context
  end
  
  def remove_contact_context
  end

    # Context for yummy_tummy_day_orders
  def create_yummy_tummy_day_order_context
  end
  
  def remove_yummy_tummy_day_order_context
  end

      # Context for meals
  def create_meal_context
  end
  
  def remove_meal_context
  end


      # Context for orders
  def create_order_context
  end
  
  def remove_order_context
  end


      # Context for users
  def create_user_context
  end
  
  def remove_user_context
  end

end