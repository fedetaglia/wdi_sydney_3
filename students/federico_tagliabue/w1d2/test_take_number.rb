def is_number? (num)
  	num.to_f.to_s == num.to_s || num.to_i.to_s == num.to_s
end

def take_number
	puts "give me the number"
	number = gets.chomp
	
	until is_number?(number)
		number = gets.chomp
	end
	return number.to_f
end


take_number