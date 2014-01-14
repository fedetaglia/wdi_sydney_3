require "sinatra"
require "sinatra/reloader" if development?	# allow me not to restart sinatra server each time I make changes in main.rb

get "/subway" do
	lines = Hash.new 
	trip = {}		# Hash with the final result of the program : list of line - station
	stations = []

	lines["N"] = ["times square", "34th", "28th", "23rd", "union square", "8th"]
	lines["L"] = ["8th", "6th", "union square", "3rd", "1st"]
	lines["6"] = ["grand central", "33rd", "28th", "23rd", "union square", "astor", "place"]
	
if params[:start_point] != nil
	
	start_line, start_station = params[:start_point].split(" - ")
	finish_line, finish_station = params[:final_point].split(" - ")
	

	def find_station (lines, line1, station1, line2, station2)
		index1 = lines[line1].index(station1)
		index2 = lines[line1].index(station2)
		actual_station_index = index1
		length = (index2 - index1).abs
		stations = []
		if index2 <= index1
			while (actual_station_index >= index2) do
				stations << lines[line2][actual_station_index]
				actual_station_index -= 1
			end
		else
			while (actual_station_index <= index2 ) do
				stations << lines[line2][actual_station_index]
				actual_station_index += 1
			end
		end

		return stations, length
	end

	
	intersections = (lines["N"] & lines["L"] & lines["6"]).each {|i| i}
	intersection = intersections[0]

	
		if start_line == finish_line	
			trip[start_line], trip_length = find_station(lines, start_line, start_station, finish_line, finish_station)
			
		else 	# else means that the start line is different than the finish line	
			trip[start_line], start_trip_length = find_station(lines, start_line, start_station, start_line, intersection)
			trip[finish_line], final_trip_length  = find_station(lines, finish_line, intersection, finish_line, finish_station)
			trip_length = start_trip_length + final_trip_length
		end
end

	@lines = lines
	@start_line = start_line
	@start_station = start_station
	@finish_line = finish_line
	@finish_station = finish_station
	@trip = trip
	@trip_length = trip_length

	erb :subway
end