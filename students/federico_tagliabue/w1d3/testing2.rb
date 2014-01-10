lines = Hash.new 

lines["N"] = ["times square", "34th", "28th", "23rd", "union square", "8th"]
lines["L"] = ["8th", "6th", "union square", "3rd", "1st"]
lines["6"] = ["grand central", "33rd", "28th", "23rd", "union square", "astor", "place"]


intersections = (lines["N"] & lines["L"] & lines["6"]).each {|i| i}

intersection = intersections[0]
puts intersection
puts intersection.class
