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