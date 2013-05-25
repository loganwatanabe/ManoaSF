FactoryGirl.define do

  factory :leader do
    first_name "Logan"
    last_name "Watanabe"
    nickname nil
    date_of_birth 20.years.ago.to_date
    notes nil
    phone "808-497-7749"
    specialty "fitness"
    female false

  end
  
  factory :group do
    association :leader
    name "Group 1"
    max_age nil
    max_grade nil
    min_age nil
    min_grade nil
    rotation 1
    homeroom "Gym"
  end
  
  factory :participant do
    association :group
    first_name "Timmy"
    last_name "Toddler"
    nickname  nil
    date_of_birth 11.years.ago.to_date
    grade 4
    notes nil
    role 'child'
    female false
    school "Manoa Elementary"
    active nil
  end
  
  factory :contact do
    first_name "Herbet"
    last_name "Toddler"
    association :participant
    relation "Father"
  end

  factory :yummy_tummy_day_order do
    association :participant
  end
  
  factory :meal do
    cost 5.50
    date 2.weeks.from_now.to_date
    food "McDonalds"
    number 3
  end

  factory :order do
    association :yummy_tummy_day_order
    association :meal
    delivered nil
    quantity 1
  end

  factory :user do
    email "logan@manoa.com"
    password "secret123"
    password_confirmation "secret123" 
    role "admin"
    username "logan"

  end

  factory :phone_number do
    association :contact
    phone 8089882688
    phone_type "home"
  end

  factory :absence do

  end

end