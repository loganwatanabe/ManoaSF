class Participant < ActiveRecord::Base
  
  	#stuff for functionality
  	scoped_search :on => [:first_name, :last_name, :nickname]
	#callbacks

	#active has no use yet, just set it to nil



	#relationships
	belongs_to :group
	#belongs_to :leader, :through => :group
	has_many :contacts
	has_many :phone_numbers, :through => :contacts
	has_one :yummy_tummy_day_order
	has_many :orders, :through => :yummy_tummy_day_order
	has_many :absences


	#for nested forms
	accepts_nested_attributes_for :contacts, :reject_if => lambda { |contact| contact[:first_name].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :absences, :reject_if => lambda { |absence| absence[:start_date].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :yummy_tummy_day_order, :reject_if => lambda { |ytd| ytd[:total_cost].nil? }, :allow_destroy => true


	#scopes
	scope :alphabetical, lambda { order('last_name, first_name')}
	scope :by_group, lambda { joins(:group).order('name')}
	scope :for_group, lambda {|group_id| where("group_id = ?", group_id) }
	scope :by_age, lambda { order('date_of_birth')}
	scope :by_grade, lambda { order('grade')}
	scope :for_grade, lambda {|grade| where("grade = ?", grade) }
	scope :children, lambda { where('role = ?', 'child')}
	scope :juniors, lambda { where('role = ?', 'junior')}
	scope :females, lambda { where('female = ?', true) }
    scope :males, lambda { where('female = ?', false) }

	# 	#for search purposes
	# scope :search, lambda { |term| where('first_name LIKE ? OR last_name LIKE ? OR nickname LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%") }



	#validations
	ROLES = [['Child', :child],['Junior Leader', :junior]]

	validates_presence_of :first_name, :last_name, :role, :group_id
  	validates_date :date_of_birth, :on_or_before => lambda { 3.years.ago }, :on_or_before_message => "must be at least 3 years old"
  	validates_numericality_of :grade, :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 13
	validates_inclusion_of :role, :in => %w[child junior], :message => "is not recognized by the system"

	validates_inclusion_of :female, :in => [true, false], :message => "must be true or false", :allow_nil => false
	validates_inclusion_of :active, :in => [true, false], :message => "must be true or false", :allow_nil => true
  
  	validates_numericality_of :group_id, :only_integer => true, :greater_than => 0

	#methods

	def gender ##################
      return "Female" if female
      "Male"
      # female ? "Female" : "Male"
    end  

	def name
   		"#{last_name}, #{first_name}"
  	end
  
  	def proper_name
   	 	"#{first_name} #{last_name}"
  	end
  
  	def age
	  now = Time.now.utc.to_date
	  now.year - date_of_birth.year - (date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
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
  		if self.junior?
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

  	def check_ytd

  	end

end
