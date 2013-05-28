module ApplicationHelper


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
