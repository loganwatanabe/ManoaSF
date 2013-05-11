class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :role, :username


  has_secure_password
  
  # Validations
  validates_uniqueness_of :username, :case_sensitive => false
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format"
  validates_inclusion_of :role, :in => %w[admin member], :message => "is not recognized by the system"

  #commented out because profH said it messes up the nested forms
  #validate :student_is_active_in_system, :on => :create
  
  # for use in authorizing with CanCan
  ROLES = [['Administrator', :admin],['Member', :member]]

  def role?(authorized_role)
    return false if role.nil?
    role.downcase.to_sym == authorized_role
  end
  
  # alternative methods (some find more natural...)
  def is_admin?
    role == 'admin'
  end
  
  def is_member?
    role == 'member'
  end

  # login by email address
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
  
  
end
