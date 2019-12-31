require "pry"

require_relative "../config/environment.rb"

ingredient1 = Ingredient.create(name: "sugar")
ingredient2 = Ingredient.create(name: "syrup")
ingredient3 = Ingredient.create(name: "syrup")

cocktail1 = Cocktail.create(name: "the first cocktail", instructions: "A magic cocktail")
cocktail2 = Cocktail.create(name: "the second cocktail", instructions: "Pour liquid into cup")
cocktail3 = Cocktail.create(name: "the third cocktail", instructions: "Drink")

cocktail_ingredient1 = CocktailIngredient.create(amount: '1')


def make_cocktail(name, instructions, ingredients_arr, amounts_arr)

  {name: name,
  instructions: instructions,
   ingredients: {
     'ingredient_name': 'ingredient_amount' # for each ingredient in ingredient_arr 
   }}
    

end



def select_random_cocktail
  random_cocktail = Cocktail.all.sample
  random_cocktail.name
end

puts select_random_cocktail()
