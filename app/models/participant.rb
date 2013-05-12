class Participant < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :grade, :group_id, :last_name, :nickname, :notes, :role


  	scoped_search :on => [:first_name, :last_name, :nickname]
	#callbacks



	#relationships
	belongs_to :group
	#belongs_to :leader, :through => :group
	has_many :contacts
	has_one :yummy_tummy_day_order
	has_many :orders, :through => :yummy_tummy_day_order



	#scopes
	scope :alphabetical, order('last_name, first_name')
	scope :by_group, joins(:group).order('number')
	scope :for_group, lambda {|group_id| where("group_id = ?", group_id) }
	scope :by_age, order('date_of_birth')
	scope :by_grade, order('grade')
	scope :for_grade, lambda {|grade| where("grade = ?", grade) }
	scope :children, where('role = ?', 'child')
	scope :juniors, where('role = ?', 'junior')

	# 	#for search purposes
	# scope :search, lambda { |term| where('first_name LIKE ? OR last_name LIKE ? OR nickname LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%") }



	#validations
	ROLES = [['Child', :child],['Junior Leader', :junior]]

	validates_presence_of :first_name, :last_name, :date_of_birth, :role
  	validates_date :date_of_birth, :on_or_before => lambda { 3.years.ago }, :on_or_before_message => "must be at least 3 years old"
  	validates_numericality_of :grade, :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 13
	validates_inclusion_of :role, :in => %w[child junior], :message => "is not recognized by the system"
  
  	validates_numericality_of :group_id, :only_integer => true, :greater_than => 0

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

	def role?(authorized_role)
	 	 return false if role.nil?
	  	role.downcase.to_sym == authorized_role
	end
	  
 	# alternative methods (some find more natural...)
	def child?
	  	role == 'child'
 	end
	  
	def junior?
	 	 role == 'junior'
 	end


  	private

  	#MOST LIKELY WON'T USE THIS
	#don't use this, only here if they need to implement constraints
  	def validates_child_group
  		if self.is_junior?
  			return true
  		else
  			#only children here
  			if self.age < self.group.min_age or self.age > self.group.max_age
  				errors.add(:group_id, "not the appropriate age")
  				return false
  			end

  			if self.grade < self.group.min_grade or self.grade > self.group.max_grade
  				errors.add(:student_id, "not the approrpiate grade")
  				return false
  			end
  		end
  	end

end
