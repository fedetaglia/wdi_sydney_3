class Client
	attr_accessor :name, :num_children, :age, :num_pets, :pet

	def initialize (name, num_children, age)
		@name = name
		@num_children = num_children
		@age = age
		@num_pet = 0
		@pet = []
	end
	
end