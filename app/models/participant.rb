class Participant < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :grade, :group_id, :last_name, :nickname, :notes, :role


	#callbacks



	#relationships
	belongs_to :group
	has_many :contacts
	has_one :yummy_tummy_day_order
	has_many :orders, :through => :yummy_tummy_day_order



	#scopes
	scope :alphabetical, order('last_name, first_name')
	scope :by_group, order('group_id')
	scope :for_group, lambda {|group| where("group_id = ?", group) }
	scope :by_age, order('date_of_birth')
	scope :by_grade, order('grade')
	scope :for_grade, lambda {|grade| where("grade = ?", grade) }
	scope :children, where('role = ?', 'child')
	scope :juniors, where('role = ?', 'junior')

		#for search purposes
	scope :search, lambda { |term| where('first_name LIKE ? OR last_name LIKE ? OR nickname LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%") }



	#validations
	ROLES = [['Child', :child],['Junior Leader', :junior]]

	validates_presence_of :first_name, :last_name, :date_of_birth
  	validates_date :date_of_birth, :on_or_before => lambda { 3.years.ago }, :on_or_before_message => "must be at least 3 years old"
  	validates_numericality_of :grade, :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 13
	validates_inclusion_of :role, :in => %w[child junior], :message => "is not recognized by the system"
  
  	validates_numericality_of :group_id, :only_integer => true, :greater_than_or_equal_to => 0

	#methods
	def name
   		"#{last_name}, #{first_name}"
  	end
  
  	def proper_name
   	 	"#{first_name} #{last_name}"
  	end
  
  	def age
   		 return nil if date_of_birth.blank?
    	(Time.now.to_s(:number).to_i - date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
  	end



end
