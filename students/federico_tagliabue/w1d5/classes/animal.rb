class Animal
	attr_accessor :name, :age, :gender, :species, :toy, :shelter, :client

	def initialize (name, age, gender, species)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toy = []
		@shelter = nil
		@client = nil
	end

end
