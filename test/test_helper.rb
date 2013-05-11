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
    @group1=FactoryGirl.create(:group, :leader => @monica)
    @group2=FactoryGirl.create(:group, :leader => @jp)
    @group3=FactoryGirl.create(:group, :leader => @bt, :rotation => 2)
    @group4=FactoryGirl.create(:group, :leader => @logan, :rotation => 2)
    @group5=FactoryGirl.create(:group, :leader => @nick, :rotation => 3)
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
  end
  
  def remove_participant_context
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