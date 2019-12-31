require "pry"

require_relative "../config/environment.rb"

ingredient1 = Ingredient.create(name: "sugar")

puts Ingredient.all
