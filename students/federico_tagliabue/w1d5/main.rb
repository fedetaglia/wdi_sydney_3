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
	# filter only the spare animal !! 
	if @animals.keys.count > 0 && @shelters.keys.count > 0
		puts "#{@animals.keys}"
		animal = Console.ask("which animal?",@animals.keys)
		puts "#{@shelters.keys}"
		shelter = Console.ask("which shelter",@shelters.keys)
		if 	@shelters[shelter].animals.keys.include? animal
			puts "already exist an animal with the same name"
		else
			@shelters[shelter].animals[animal] = @animals[animal]
			@animals[animal].shelter = @shelters[shelter]
			binding.pry
		end
	else
		puts "you dont have any animal or shelter!"
	end
	Console.esc
end

def add_client_to_shelter
	if @clients.keys.count > 0 && @shelters.keys.count > 0
		puts "#{@clients.keys}"
		client = Console.ask("which client?",@clients.keys)
		puts "#{@shelters.keys}"
		shelter = Console.ask("which shelter",@shelters.keys)
		if 	@shelters[shelter].clients.keys.include? client
			puts "already exist a client with the same name"
		else
			@shelters[shelter].clients[client] = @clients[client]
			@clients[client].shelters[shelter] = @shelters[shelter]
		end
	else
		puts "you dont have any clients or shelter!"
	end
	Console.esc
end

def client_adopt_animal
	if @shelters.count > 0
		puts "#{@shelters.keys}"
		shelter = Console.ask("In which shelter you want make an adoption?",@shelters.keys)
		if shelter != nil && @shelters[shelter].clients.count > 0 && @shelters[shelter].animals.count
		puts "#{@shelters[shelter].clients.keys}"
		client = Console.ask("which client want to adopt?",@shelters[shelter].clients.keys)
		puts "#{@shelters[shelter].animals.keys}"
		animal = Console.ask("which animal you want to adopt",@shelters[shelter].animals.keys)
		if 	@shelters[shelter].clients[client].pets.keys.include? animal
			puts "already have a pet with the same name"
		else
			@shelters[shelter].clients[client].pets[animal] = @shelters[shelter].animals[animal]
			@shelters[shelter].animals.delete(animal)
		end

		else
			puts "you dont have any clients or shelter!"
		end
	else
		puts "you dont have any shelters"
	end
	Console.esc
end

def show_clients
	puts "here the spare clients : "
	@clients.each {|key,client| 
		if client.shelters.count == 0
			puts "#{key} is #{client.age} years old and has #{client.num_children} children ! "
		end
	}
	puts
	@shelters.each {|key,shelter|
		puts "List of clients of #{key} :"
		shelter.clients.each { |c_key, client|
			puts "#{c_key} is #{client.age} years old and has #{client.num_children} children ! "

			# print "#{c_key} has #{client.pets.keys.count} animals"
			# if client.pets.keys.count > 0 
			# puts " :"
			# client.pets.each {|a_key, animal|
			# 	puts "#{a_key} is a #{animal.species} and it's a #{animal.gender} of #{animal.age} years!"
			# }
			# end
		}
	}
	Console.esc
end

def show_shelters
	puts "here the shelters you created : "
	@shelters.each {|key,shelter| puts "#{key}"}	
	Console.esc
end

def show_animals
	puts "List of spare animals : "
	@animals.each {|key,animal| 
		if animal.shelter == nil
			puts "#{key} is a #{animal.species} and it's a #{animal.gender} of #{animal.age} years!"
		end
	}
	puts
	@shelters.each {|key,shelter|
		if shelter.animals.keys.count > 0 
			puts "List of animals inside #{key} :"
			shelter.animals.each { |a_key, animal|
				puts "#{a_key} is a #{animal.species} and it's a #{animal.gender} of #{animal.age} years!"
				}
		end
	}
	@clients.each {|key,client|
		if client.pets.keys.count > 0 
			puts "#{key} has these pets :"
			client.pets.each { |a_key, pet|
				puts "#{a_key} is a #{pet.species} and it's a #{pet.gender} of #{pet.age} years!"
				}
		end
	}
	Console.esc
end

def menu(app)
	Console.header("Welcome to HappiTails!")
	valid_options = ["1","2","3","4","5","6","7","8","9","10","q"]
	puts " 1 - Create a new animal"
	puts " 2 - Create a new client"
	puts " 3 - Create a new shelter"
	puts " 4 - Add a spare animal to a shelter"
	puts " 5 - Add a client to a shelter"
	puts " 6 - Let a client adopt an animal"
	puts
	puts " 8 - Show existing clients"
	puts " 9 - Show existing animals"
	puts "10 - Show existing shelters"
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
			app.add_client_to_shelter
		when "6"
			app.client_adopt_animal
		when "7"
			# let client puts an animal up to adoption into shelter
		when "8"
			app.show_clients
		when "9"
			app.show_animals
		when "10"
			app.show_shelters
		when "q"
			Console.footer
	end
	return choice
end

end


app = Main.new

app.shelters["happi"] = Shelter.new
app.animals["nemo"] = Animal.new("nemo",28,"male","fish")
app.clients["fede"] = Client.new("fede",0,30)

# binding.pry
begin
	choice = app.menu(app)
end until choice == "q"


