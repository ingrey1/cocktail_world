require "pry"

require_relative "../config/environment.rb"

ingredient1 = Ingredient.create(name: "sugar")
ingredient2 = Ingredient.create(name: "syrup")
ingredient3 = Ingredient.create(name: "syrup")
cocktail1 = Cocktail.create(name: "the first cocktail", instructions: "A magic cocktail")
cocktail_ingredient1 = CocktailIngredient.create(amount: '1')



def all_ingredients
  array = []
  Ingredient.all.map do |ingredient|
    array << ingredient.name 
  end
  array.uniq
end

puts all_ingredients()
