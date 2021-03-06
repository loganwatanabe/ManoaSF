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
    @logan = FactoryGirl.create(:leader, date_of_birth: 20.years.ago.to_date)
    @nick = FactoryGirl.create(:leader, first_name: "Nick", last_name: "Deng", date_of_birth: 23.years.ago.to_date, specialty: "Music", phone: "8081234567")
    @monica = FactoryGirl.create(:leader, first_name: "Monica", last_name: "Foolsey", date_of_birth: 26.years.ago.to_date, specialty: "Arts & Crafts", phone: "8085550011", female: true)
    @bt = FactoryGirl.create(:leader, first_name: "Bryce", last_name: "Tomato", nickname: "BT", date_of_birth: 29.years.ago.to_date, specialty: "Fitness", phone: "8081116969")
    @jp = FactoryGirl.create(:leader, first_name: "Janice", last_name: "Perrigo", nickname: "JP", date_of_birth: 18.years.ago.to_date, specialty: "Sports & Games", phone: "8086431111", female: true)
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
    @group1=FactoryGirl.create(:group, :name => "Group 1", :leader => @monica)
    @group4=FactoryGirl.create(:group, :name => "Group 4", :leader => @logan, :rotation => 2)
    @group2=FactoryGirl.create(:group, :name => "Group 2", :leader => @jp)
    @office=FactoryGirl.create(:group, :name => "Office", :leader => @nick, :rotation => 3)
    @group3=FactoryGirl.create(:group, :name => "Group 3", :leader => @bt, :rotation => 2)

  end
  
  def remove_group_context
    @group1.destroy
    @group2.destroy
    @group3.destroy
    @group4.destroy
    @office.destroy
  end


  # Context for participants
  def create_participant_context
    #children
    @timmy = FactoryGirl.create(:participant, group: @group3)
    @adam = FactoryGirl.create(:participant, first_name: "Adam", last_name: "Adamson", date_of_birth: 5.years.ago.to_date, grade: 0, group: @group1)
    @betty = FactoryGirl.create(:participant, first_name: "Betty", last_name: "Bettle", date_of_birth: 10.years.ago.to_date, grade: 3, group: @group3, female: true)
    @eric = FactoryGirl.create(:participant, first_name: "Eric", last_name: "Ernie", date_of_birth: 10.years.ago.to_date, grade: 5, group: @group4)
    @annie = FactoryGirl.create(:participant, first_name: "Annie", last_name: "Anderson", date_of_birth: 7.years.ago.to_date, grade: 1, group: @group2, female: true)
    @benny = FactoryGirl.create(:participant, first_name: "Benny", last_name: "Benson", nickname: "Ben", date_of_birth: 8.years.ago.to_date, grade: 2, group: @group2)

    #junior leaders
    @yi = FactoryGirl.create(:participant, role: 'junior', first_name: "Yi", last_name: "Young", nickname: "Jack", date_of_birth: 13.years.ago.to_date, grade: 9, group: @group2)
    @gina = FactoryGirl.create(:participant, role: 'junior', first_name: "Gina", last_name: "Goldberg", date_of_birth: 12.years.ago.to_date, grade: 7, group: @group3, female: true)
    @zach = FactoryGirl.create(:participant, role: 'junior', first_name: "Zach", last_name: "Zoidberg", date_of_birth: 15.years.ago.to_date, grade: 10, group: @group1)
    @sam = FactoryGirl.create(:participant, role: 'junior', first_name: "Sam", last_name: "Sampson", date_of_birth: 16.years.ago.to_date, grade: 10, group: @group4)
    @oren = FactoryGirl.create(:participant, role: 'junior', first_name: "Oren", last_name: "Ogletree", date_of_birth: 18.years.ago.to_date, grade: 11, group: @office)



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
    @tim_dad = FactoryGirl.create(:contact, participant: @timmy)
    @tim_mom = FactoryGirl.create(:contact, participant: @timmy, first_name: "Tina", relation: "Mother")
    @zach_dad = FactoryGirl.create(:contact, participant: @zach, first_name: "Finn", last_name: "Zoidberg")
    @zach_mom = FactoryGirl.create(:contact, participant: @zach, first_name: "Leslie", last_name: "Zoidberg", relation: "Mother")
    @annie_dr = FactoryGirl.create(:contact, participant: @annie, first_name: "Wilbur", last_name: "Einstein", relation: "Doctor")
    @eric_aunty = FactoryGirl.create(:contact, participant: @eric, first_name: "Kanani", last_name: "Koleslaw", relation: "Aunty")
  end
  
  def remove_contact_context
    @tim_dad.destroy
    @tim_mom.destroy
    @zach_dad.destroy
    @zach_mom.destroy
    @annie_dr.destroy
    @eric_aunty.destroy
  end

    # Context for yummy_tummy_day_orders
  def create_yummy_tummy_day_order_context
    @tim_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @timmy)
    @annie_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @annie)
    @eric_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @eric)
    @zach_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @zach)
    @gina_ytd = FactoryGirl.create(:yummy_tummy_day_order, participant: @gina)

  end
  
  def remove_yummy_tummy_day_order_context
    @tim_ytd.destroy
    @annie_ytd.destroy
    @eric_ytd.destroy
    @zach_ytd.destroy
    @gina_ytd.destroy
  end

      # Context for meals
  def create_meal_context
    @pizza_cheese = FactoryGirl.create(:meal, food: "Cheese Pizza", cost: 5.00, date: 1.week.from_now.to_date, number: 2)
    @pizza_supreme = FactoryGirl.create(:meal, food: "Supreme Pizza", cost: 5.00, date: 1.week.from_now.to_date, number: 3)
    @mcdonalds_nuggets = FactoryGirl.create(:meal, food: "Chicken Nuggets", cost: 5.00, date: 2.weeks.from_now.to_date, number: 4)
    @mcdonalds_burger = FactoryGirl.create(:meal, food: "Hamburger", cost: 5.00, date: 2.weeks.from_now.to_date, number: 5)
    @chicken = FactoryGirl.create(:meal, food: "Chicken", cost: 4.50, date: 3.weeks.from_now.to_date, number: 6)
    @subway_turkey = FactoryGirl.create(:meal, food: "Turkey Subway", cost: 5.00, date: 5.weeks.from_now.to_date, number: 7)
    @subway_ham = FactoryGirl.create(:meal, food: "Ham Subway", cost: 5.00, date: 5.weeks.from_now.to_date, number: 8)
    @musubi_spam = FactoryGirl.create(:meal, food: "Spam Musubi", cost: 4.00, date: 6.weeks.from_now.to_date, number: 9)
    @musubi_chicken = FactoryGirl.create(:meal, food: "Chicken Musubi", cost: 4.00, date: 6.weeks.from_now.to_date, number: 10)
    @apples = FactoryGirl.create(:meal, food: "Apples", cost: 2.50, date: 3.days.ago.to_date, number: 1)
  end
  
  def remove_meal_context
    @pizza_cheese.destroy
    @pizza_supreme.destroy
    @mcdonalds_nuggets.destroy
    @mcdonalds_burger.destroy
    @chicken.destroy
    @subway_turkey.destroy
    @subway_ham.destroy
    @musubi_spam.destroy
    @musubi_chicken.destroy
    @apples.destroy
  end

    #apples, hamburger, musubi spam, musubi chicken, pizza_cheese, chicken

    # @tim_ytd apples hamburger spam cheese chicken
    # @annie_ytd apples nuggets chicken supreme chicken
    # @eric_ytd apples, nuggets, chicken
    # @zach_ytd applesx2, nuggets & hamburger, spam&chicken, cheese&supreme, chickenx2
    # @gina_ytd spam, supreme, chicken


      # Context for orders
  def create_order_context
    @tim_apple = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @apples, quantity: 1, delivered: true)
    @tim_burger = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @mcdonalds_burger , quantity: 1)
    @tim_spam = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @musubi_spam , quantity: 1)
    @tim_cheese = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @pizza_cheese , quantity: 1)
    @tim_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @tim_ytd , meal: @chicken , quantity: 1)
    @annie_apple = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @apples , quantity: 1, delivered: true)
    @annie_nuggets = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @mcdonalds_nuggets , quantity: 1)
    @annie_chicken_mus = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @musubi_chicken , quantity: 2)
    @annie_supreme = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @pizza_supreme , quantity: 1)
    @annie_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @annie_ytd , meal: @chicken , quantity: 1)
    @eric_apple = FactoryGirl.create(:order, yummy_tummy_day_order: @eric_ytd , meal: @apples , quantity: 2, delivered: false)
    @eric_nuggets = FactoryGirl.create(:order, yummy_tummy_day_order: @eric_ytd , meal: @mcdonalds_nuggets , quantity: 1)
    @eric_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @eric_ytd , meal: @chicken , quantity: 1)
    @zach_apple = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @apples , quantity: 2, delivered: false)
    @zach_nuggets = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @mcdonalds_nuggets , quantity: 1)
    @zach_burger = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @mcdonalds_burger , quantity: 1)
    @zach_spam = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @musubi_spam , quantity: 1)
    @zach_chicken_mus = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @musubi_chicken , quantity: 1)
    @zach_cheese = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @pizza_cheese , quantity: 1)
    @zach_supreme = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @pizza_supreme , quantity: 1)
    @zach_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @zach_ytd , meal: @chicken , quantity: 2)
    @gina_spam = FactoryGirl.create(:order, yummy_tummy_day_order: @gina_ytd , meal: @musubi_spam , quantity: 1)
    @gina_chicken = FactoryGirl.create(:order, yummy_tummy_day_order: @gina_ytd , meal: @chicken , quantity: 1)
    @gina_supreme = FactoryGirl.create(:order, yummy_tummy_day_order: @gina_ytd , meal: @pizza_supreme , quantity: 1)
  end
  
  def remove_order_context
    @tim_apple.destroy
    @tim_burger.destroy
    @tim_spam.destroy
    @tim_cheese.destroy
    @tim_chicken.destroy
    @annie_apple.destroy
    @annie_nuggets.destroy
    @annie_chicken_mus.destroy
    @annie_supreme.destroy
    @annie_chicken.destroy
    @eric_apple.destroy
    @eric_nuggets.destroy
    @eric_chicken.destroy
    @zach_apple.destroy
    @zach_nuggets.destroy
    @zach_burger.destroy
    @zach_spam.destroy
    @zach_chicken_mus.destroy
    @zach_cheese.destroy
    @zach_supreme.destroy
    @zach_chicken.destroy
    @gina_spam.destroy
    @gina_chicken.destroy
    @gina_supreme.destroy

  end


      # Context for phones
  def create_phone_number_context
    @tim_dad_1 = FactoryGirl.create(:phone_number, contact: @tim_dad, phone: "8089882002", phone_type: "cell")
    @tim_mom_1 = FactoryGirl.create(:phone_number, contact: @tim_mom, phone: "8089882770", phone_type: "home")
    @tim_mom_2 = FactoryGirl.create(:phone_number, contact: @tim_mom, phone: "8082200134", phone_type: "cell")
    @zach_dad_1 = FactoryGirl.create(:phone_number, contact: @zach_dad, phone: "8083457777", phone_type: "cell")
    @zach_dad_2 = FactoryGirl.create(:phone_number, contact: @zach_dad, phone: "8082209834", phone_type: "home")
    @zach_mom_1 = FactoryGirl.create(:phone_number, contact: @zach_mom, phone: "8083466677", phone_type: "work")
    @zach_mom_2 = FactoryGirl.create(:phone_number, contact: @zach_mom, phone: "8089881234", phone_type: "home")
    @annie_dr_1 = FactoryGirl.create(:phone_number, contact: @annie_dr, phone: "8087443174", phone_type: "work")
    @eric_aunty_1 = FactoryGirl.create(:phone_number, contact: @eric_aunty, phone: "8089876546", phone_type: "cell")
  end
  
  def remove_phone_number_context
    @tim_dad_1.destroy
    @tim_mom_1.destroy
    @tim_mom_2.destroy
    @zach_dad_1.destroy
    @zach_dad_2.destroy
    @zach_mom_1.destroy
    @zach_mom_2.destroy
    @annie_dr_1.destroy
    @eric_aunty_1.destroy
  end

      # Context for absences
  def create_absence_context
    @tim_absence_1 = FactoryGirl.create(:absence, participant: @timmy, start_date: Date.today.to_date, end_date: 5.days.from_now.to_date, days_gone: 4 )
    @tim_absence_2 = FactoryGirl.create(:absence, participant: @timmy, start_date: 2.weeks.from_now.to_date , end_date: 3.weeks.from_now.to_date, days_gone: 7 )
    @gina_absence = FactoryGirl.create(:absence, participant: @gina, start_date: Date.today.to_date, end_date: 2.weeks.from_now.to_date, days_gone: nil)
    @zach_absence = FactoryGirl.create(:absence, participant: @zach, start_date: 1.day.from_now.to_date, end_date: 1.day.from_now.to_date, days_gone: 1 )
    @annie_absence = FactoryGirl.create(:absence, participant: @annie, start_date: 2.days.ago.to_date, end_date: 2.days.from_now.to_date, days_gone:  4)
  end
  
  def remove_absence_context
    @tim_absence_1.destroy
    @tim_absence_2.destroy
    @gina_absence.destroy
    @zach_absence.destroy
    @annie_absence.destroy
  end

      # Context for users
  def create_user_context
  end
  
  def remove_user_context
  end

end