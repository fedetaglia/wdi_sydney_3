class AllergyError < RuntimeError; end
class DeclineError < RuntimeError; end

menu = {}
menu["pizza"] = %w(cheese gluten tomato)
menu["salad mix"] = %w(salad cheese tomato corn)
menu["salad mix2"] = %w(rocket-salad cheese chicken tomato corn)
menu["veggie salad"] = %w(salad tomato corn)
menu["second menu"] = %w(meat chips tomato)

class Person
	attr_accessor :stomach, :allergy, :declined

	def initialize
		@stomach = []
		@allergy = []
		@declined = []
	end
	
	def eat(food)
		if (food & allergy).count > 0
			raise AllergyError
		elsif (food & declined).count > 0
			raise DeclineError
		else	
			@stomach << food
			@stomach.flatten
		end
	end
end

class Dinner

	def initialize
		@guests = {}
	end

	def create_guest(name)
		@guests[name] = Person.new # Proc.new {|x| x = Person.new}
	end
	
	def show_guests
		puts "Your guests are : "
		puts @guests.keys
	end
		
	def show_allergy_and_declined
		puts @guests.each {|guest,person| puts "#{guest} is allergic to : #{person.allergy} and don't like : #{person.declined}" }
	end

	def invite_person
		begin
		puts "Who do you want to call for dinner?"
		new_guest = gets.chomp
			if @guests.keys.include? new_guest
				puts "you already call #{new_guest}"
			else
				print "I'm calling #{new_guest} .. "
				create_guest(new_guest)
				#put an exception here!
				puts "#{new_guest} accept to join!"

				give_allergy(new_guest)
				add_declined(new_guest)
			end 
		puts "do you want call someone else? (y)es - (n)o"
		flag = gets.chomp
		
		end while flag  =="y"
		
	end

	def give_allergy(new_guest)
		puts "#{new_guest} is allergic? (y)es - (n)o"
			if input = gets.chomp == "y"
				begin
					puts "give #{new_guest} an allergy"
					new_allergy = gets.chomp
					@guests[new_guest].allergy << new_allergy
					puts "has another one? (y)es - (n)o"
				end while flag = gets.chomp	== "y"
			end
	end

	def add_declined(new_guest)
		puts "#{new_guest} does not like something? (y)es - (n)o"
			if input = gets.chomp == "y"
				begin
					puts "what #{new_guest} does not like?"
					new_dislike = gets.chomp
					@guests[new_guest].declined << new_dislike
					puts "has another one? (y)es - (n)o"
				end while flat = gets.chomp	== "y"
			end
	end
end	

dinner = Dinner.new
dinner.invite_person

puts "dinner.show_guests"
puts dinner.show_guests
puts "dinner.show_allergy_and_declined"
puts dinner.show_allergy_and_declined


