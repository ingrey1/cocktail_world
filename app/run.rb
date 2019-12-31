require "pry"

require_relative "../config/environment.rb"

ingredient1 = Ingredient.create(name: "sugar")
cocktail1 = Cocktail.create(name: "the first cocktail", description: "A magic cocktail")
cocktail_ingredient1 = CocktailIngredient.create(amount: "1")

def all_ingredients
  Ingredient.all.map do |ingredient|
    ingredient.name
  end
end

 puts all_ingredients()

