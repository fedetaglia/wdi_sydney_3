class Console

def self.ask(question, check = nil)
	# a loop has to start here
	print "#{question} >> "
	answer = gets.chomp
	if check == nil
	elsif check == ["string"]
		# check if string
	elsif check == ["integer"]
		# check if integer
	elsif check == ["float"]
		# check if float
	else 
		if check.include? answer
			# thanks 
		else
			puts "error here" # check if array or string
		end
	end
	# error handling - ask to insert another value
	# end of loop if check is verified
	return answer
end

def self.header(title)
	puts "\e[H\e[2J" # clear screen
	puts "#{title}"
	puts
end

def self.footer
	puts
	puts "see you the next time!"
	puts
end

def self.esc
	puts
	esc = Console.ask("press any key to go beck to the menu!")	
end


end