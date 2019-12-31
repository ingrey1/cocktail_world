require "pry"

require_relative "../config/environment.rb"

ingredient1 = Ingredient.create(name: "sugar")
cocktail1 = Cocktail.create(name: "the first cocktail", description: "A magic cocktail")
