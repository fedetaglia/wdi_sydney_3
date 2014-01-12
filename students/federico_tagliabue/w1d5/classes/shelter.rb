require "./classes/animal"
require "./classes/client"

class Shelter
	attr_accessor :animals, :clients

	def initialize
		@animals = {}
		@clients = {}
	end

end
