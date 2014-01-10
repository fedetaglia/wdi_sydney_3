lines = Hash.new 

lines["N"] = ["times square", "34th", "28th", "23rd", "union square", "8th"]
lines["L"] = ["8th", "6th", "union square", "3rd", "1st"]
lines["6"] = ["grand central", "33rd", "28th", "23rd", "union square", "astor", "place"]

def header
	puts "\e[H\e[2J" # clear screen
	puts "Federico's Subway App"
	puts
end

def footer
	puts
	puts "see you the next time!"
	puts
end

def check_line (status, lines)
	puts "which is your #{status} line?	N - L - 6"
	line = gets.chomp.capitalize
	until lines.keys.include? line	
		puts "insert a valid line"
		line = gets.chomp.capitalize
	end
	return line
end

def check_station (status,lines,line)
	puts "which is your #{status} station?"
	lines[line].each {|staz| print "   #{staz}"}
	puts
	station = gets.chomp.downcase
	until lines[line].include? station.downcase
		puts "insert a valid station"
		station = gets.chomp.downcase
	end
	return station
end

def find_station (lines, line1, station1, line2, station2)
	
	index1 = lines[line1].index(station1)
	index2 = lines[line1].index(station2)
	actual_station_index = index1
	trip_length = (index2 - index1).abs
	stations = []
	if index2 <= index1
		while (actual_station_index >= index2) do
			stations << lines[line2][actual_station_index]
			actual_station_index -= 1
		end
	else
		while (actual_station_index - 1 < index2 ) do
			stations << lines[line2][actual_station_index]
			actual_station_index += 1
		end
	end
	# what to delete the starting station puts stations.class here or in print_result!!
	return trip_length, stations
end

def print_result (trip, trip_length)
	puts "Your trip is #{trip_length} stops"
	trip.each {|key,value|
	puts "Linea : #{key}"
		value.each {|v| 
		puts "        #{v}"}
	}
end	

# I ASSUME THERE IS ONLY ONE INTERSECTION !

intersections = (lines["N"] & lines["L"] & lines["6"]).each {|i| intersection = i}
intersection = intersections[0]

exit = 0
until exit == "n" do
	
	header

	# input for line and station 
	start_line = "N"
	start_station = "34th"
	finish_line = "N"
	finish_station = "union square"

	# start_line = check_line("starting", lines)
	# start_station = check_station("starting",lines,start_line)
	# finish_line = check_line("final", lines)
	# finish_station = check_station("final",lines,finish_line)

	trip = {}		# Hash with the final result of the program : list of line - station
	stations = []

	# check if the final station is on the same line than the start one
	if start_line == finish_line	
		trip_length, trip[start_line] = find_station(lines, start_line, start_station, finish_line, finish_station)
		
	else 	# else means that the start line is different than the finish line	
		trip[start_line] = find_station(lines, start_line, start_station, start_line, intersection)
		trip[finish_line] = find_station(lines, finish_line, intersection, finish_line, finish_station)
	end
	print_result(trip,trip_length)

	puts "Do you want to check another trip?  Y - N"
	exit = gets.chomp.downcase

end

footer