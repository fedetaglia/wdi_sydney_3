def header
	puts "\e[H\e[2J" # clear screen
	puts "Federico's Calculator"
	puts
end

def footer
	puts
	puts "see you the next time!"
	puts
end

def menu
puts	
puts "Press :"
puts
puts "STANDARD CALCULATOR"
puts "a : for Adding"
puts "s : for Subtracting"
puts "m : for Multipling"
puts "d : for Dividing"
puts
puts "ADVANCED CALCULATOR"
puts "r : for square Root"
puts "e : for Exponents"
puts 
puts "Press 'exit' to quit the program"
puts
menu = gets.chomp.downcase
end

# take the input and check if input is a number (Integer or Float)
def is_number? (num)
  	num.to_f.to_s == num.to_s || num.to_i.to_s == num.to_s
end

def take_number
	puts "give me a number"
	number = gets.chomp
	
	until is_number?(number)
		puts "Please, give me a valid number"
		number = gets.chomp
	end
	return number.to_f
end


def calculation (choice,first_number, second_number = 0)
case choice
	when "a" # adding
		result = first_number + second_number
	when "s" # subtracting
		result = first_number - second_number
	when "m" # multipling
		result = first_number * second_number
	when "d" # dividing
		result = first_number / second_number
	when "e" # exponential
		result = first_number ** second_number
	when "r" 
		result = Math.sqrt(first_number)
	else "dont know what you want to do, please try again .."
end	
end

# here the program starts
header
puts "Hi! I'm your favorite calculator, wanna you wanna do?"
input = menu

operation = %w[a s m d r e] # command for the operations that the calculator can perform

until input == "exit" do
	if operation.include? input
		if input == "r" # for square root I need only one number
			number = take_number
			solution = calculation(input,number)
		else		
			first = take_number
			second = take_number
			solution = calculation(input,first,second)
		end
		puts "The solution is #{solution}"
		puts "do you want to continue (c) or exit?"
		input = gets.chomp.downcase
		if input == "exit"
			break
		else
			header
		end
	else 
		puts "\e[H\e[2J"
		header
		puts "dont know what you wanna to do, please try again .."
	end
	input = menu
end
footer