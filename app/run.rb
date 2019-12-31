require "pry"

require_relative "../config/environment.rb"

ingredient1 = Ingredient.create(name: "sugar")
ingredient2 = Ingredient.create(name: "syrup")
ingredient3 = Ingredient.create(name: "syrup")

cocktail1 = Cocktail.create(name: "the first cocktail", instructions: "A magic cocktail")
cocktail2 = Cocktail.create(name: "the second cocktail", instructions: "Pour liquid into cup")
cocktail3 = Cocktail.create(name: "the third cocktail", instructions: "Drink")

cocktail_ingredient1 = CocktailIngredient.create(amount: '1', cocktail: cocktail1, ingredient: ingredient1)



runner = RunCocktailWorld.new()
cocktail_new = runner.retrieve_cocktail_by_name("the first cocktail")
# binding.pry
puts cocktail_new