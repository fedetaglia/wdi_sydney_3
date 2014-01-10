class AllergyError < RuntimeError; end
class DeclineError < RuntimeError; end

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



menu = {}

menu["pizza"] = %w(cheese gluten tomato)
menu["salad mix"] = %w(salad cheese tomato corn)
menu["salad mix2"] = %w(rocket-salad cheese chicken tomato corn)
menu["veggie salad"] = %w(salad tomato corn)
menu["second menu"] = %w(meat chips tomato)

fede = Person.new
fede.declined << "salad"

serena = Person.new
serena.allergy << "gluten"
serena.declined << "meat"

begin
	puts "What you wanna offer to fede ?"
	puts "pizza - salad mix - salad mix2 - veggie salad - second menu"
	choice = gets.chomp
	fede.eat(menu[choice])
	puts "fede say : thank you!"
rescue AllergyError
	puts "fede say : I'm sorry! I'm allergic, I cannot eat it!"
	retry
rescue DeclineError
	puts "fede say : ooooowww I really dont like it!"
	retry
end

puts puts

begin
	puts "What you wanna offer to serena ?"
	puts "pizza - salad mix - salad mix2 - veggie salad - second menu"
	choice = gets.chomp
	serena.eat(menu[choice])
	puts "serena say : thank you!"
rescue AllergyError
	puts "serena say : I'm sorry! I'm allergic, I cannot eat it!"
	retry
rescue DeclineError
	puts "serena say : ooooowww I really dont like it!"
	retry
end

