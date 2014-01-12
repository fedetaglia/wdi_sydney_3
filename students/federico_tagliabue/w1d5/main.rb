require "./classes/shelter.rb"
require "./classes/animal"
require "./classes/client"
require "./classes/console"
require "pry"

class Main
	attr_accessor :shelters, :animals, :clients

def initialize
	@shelters = {}
	@animals = {}
	@clients = {}
end

def create_client
	name = Console.ask("client name:")
	if @clients.keys.include? name
		puts "already exist"
	else
		age = Console.ask("age ?")
		num_child = Console.ask("child num?")
		@clients[name] = Client.new(name,num_child,age)
	end
end

def create_animal
	name = Console.ask("animal name:")
	if @animals.keys.include? name
		puts "already exist"
	else
		species = Console.ask("species?")
		age = Console.ask("age ?")
		gender = Console.ask("gender?")
		@animals[name] = Animal.new(name,age,gender,species)
	end
end

def create_shelter
	name = Console.ask("shelter name:")
	if @shelters.keys.include? name
		puts "already exist"
	else
		@shelters[name] = Shelter.new
	end
end	

def add_animal_to_shelter
	if @animals.keys.count > 0 && @shelters.keys.count > 0
		puts "#{@animals.keys}"
		name = Console.ask("which animal?",@animals.keys)
		puts "#{@shelters.keys}"
		shelter = Console.ask("which shelter",@shelters.keys)
		if 	@shelters[shelter].animals.include? name
			puts "already exist an animal with the same name"
		else
			animal_to_add = @animals[name]
			@shelters[shelter].animals[name] = animal_to_add
			@animals.delete(name)
		end
	else
		puts "you dont have any animal or shelter!"
	end
	Console.esc
end

def show_clients
	puts "here the clients you created : "
	@clients.each {|key,client| print "#{key} is #{client.age} years old and has #{client.num_children} children ! "}	
	Console.esc
end

def show_shelters
	puts "here the shelters you created : "
	@shelters.each {|key,shelter| puts "#{key} - "}	
	Console.esc
end

def show_animals
	puts "List of spare animals : "
	@animals.each {|key,animal| puts "#{key} is a #{animal.species} and it's a #{animal.gender} of #{animal.age} years!"}
	puts
	@shelters.each {|key,shelter|
		puts "List of animals inside #{key} :"
		shelter.animals.each { |a_keys, animal|
			puts "#{a_keys} is a #{animal.species} and it's a #{animal.gender} of #{animal.age} years!"
		}
	}
	Console.esc
end

def menu(app)
		Console.header("Welcome to HappiTails!")
		valid_options = ["1","2","3","4","5","6","7","8","9","q"]
		puts "1 - Create a new animal"
		puts "2 - Create a new client"
		puts "3 - Create a new shelter"
		puts "4 - Add a spare animal to a shelter"
		puts 
		puts 
		puts "7 - Show existing clients"
		puts "8 - Show existing animals"
		puts "9 - Show existing shelters"
		puts
		choice = Console.ask("Choose an option or press q to exit",valid_options)

	case choice
		when "1"
			app.create_animal
		when "2"
			app.create_client
		when "3"
			app.create_shelter
		when "4"
			app.add_animal_to_shelter
		when "5"
			# let client adopts an animal from shelter
		when "6"
			# let client puts an animal up to adoption into shelter
		when "7"
			app.show_clients
		when "8"
			app.show_animals
		when "9"
			app.show_shelters
		when "q"
			Console.footer
	end
	return choice
end

end


app = Main.new
begin
	choice = app.menu(app)
end until choice == "q"
