class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :role, :username
end
