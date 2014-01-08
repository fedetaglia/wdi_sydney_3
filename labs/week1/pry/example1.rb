require 'pry'
require 'pry-debugger'


print 'Enter your first name'

first = gets.chomp

print "Enter your last name"

last = gets.chomp

binding.pry

last = last.upcase


puts "your fullname is #{first} #{last}"