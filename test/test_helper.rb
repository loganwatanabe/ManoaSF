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
  end
  
  def remove_leader_context
  end

    # Context for group
  def create_group_context
  end
  
  def remove_group_context
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