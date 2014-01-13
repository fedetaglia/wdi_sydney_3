class Client
	attr_accessor :name, :num_children, :age, :num_pets, :pets, :shelters

	def initialize (name, num_children, age)
		@name = name
		@num_children = num_children
		@age = age
		@num_pet = 0
		@pets = {}
		@shelters = {}
	end
	
end