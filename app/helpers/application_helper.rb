module ApplicationHelper

  def grade_format(grade)
        case
        when grade == 0
          "Kindergarten"
        when grade == 1
          "First Grade"
        when grade == 2
          "Second Grade"
        when grade == 3
          "Third Grade"
        when grade == 4
          "Fourth Grade"
        when grade == 5
          "Fifth Grade"
        when grade == 6
          "Sixth Grade"
        when grade == 7
          "Seventh Grade"
        when grade == 8
          "Eighth Grade"
        when grade == 9
          "Ninth Grade"
        when grade == 10
          "Tenth Grade"
        when grade == 11
          "Elventh Grade"
        when grade == 12
          "Twelfth Grade"
        else
          "None"
        end
  end

  def price_format(price)
      if price.nil?
        "No price"
      else
       num = sprintf("%.2f",price)
       return "$#{num}"
      end 
  end

	def date_format(date)
    	if date.nil?
      	"No date"
    	else
     	 date.strftime("%m/%d/%y")
    	end 
  end


  def phone_name(phone)     #formats phone numbers nicely
    area = phone[0..2]
    local = phone[3..5]
    last = phone[6..9]
    return "#{area}-#{local}-#{last}"
  end
  
end
