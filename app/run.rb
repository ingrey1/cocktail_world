require "pry"

require_relative "../config/environment.rb"

<<<<<<< HEAD
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
=======
#ingredient1 = Ingredient.create(name: "sugar")

#cocktail1 = Cocktail.create(name: "the first cocktail", instructions: "A magic cocktail")
cocktail_info = [{
    "idDrink" => "17222",
    "strDrink" => "A1",
    "strDrinkAlternate" => nil,
    "strDrinkES" => nil,
    "strDrinkDE" => nil,
    "strDrinkFR" => nil,
    "strDrinkZ" => nil,
    "strDrinkZH" => nil,
    "strTags" => nil,
    "strVideo" => nil,
    "strCategory" => "Cocktail",
    "strIBA" => nil,
    "strAlcoholic" => "Alcoholic",
    "strGlass" => "Cocktail glass",
    "strInstructions" => "Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.",
    "strInstructionsES" => nil,
    "strInstructionsDE" => "Alle Zutaten in einen Cocktailshaker geben, mischen und über Eis in ein gekühltes Glas servieren.",
    "strInstructionsFR" => nil,
    "strDrinkThumb" => "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
    "strIngredient1" => "Gin",
    "strIngredient2" => "Grand Marnier",
    "strIngredient3" => "Lemon Juice",
    "strIngredient4" => "Grenadine",
    "strIngredient5" => nil,
    "strIngredient6" => nil,
    "strIngredient7" => nil,
    "strIngredient8" => nil,
    "strIngredient9" => nil,
    "strIngredient10" => nil,
    "strIngredient11" => nil,
    "strIngredient12" => nil,
    "strIngredient13" => nil,
    "strIngredient14" => nil,
    "strIngredient15" => nil,
    "strMeasure1" => "1 3/4 shot ",
    "strMeasure2" => "1 Shot ",
    "strMeasure3" => "1/4 Shot",
    "strMeasure4" => "1/8 Shot",
    "strMeasure5" => nil,
    "strMeasure6" => nil,
    "strMeasure7" => nil,
    "strMeasure8" => nil,
    "strMeasure9" => nil,
    "strMeasure10" => nil,
    "strMeasure11" => nil,
    "strMeasure12" => nil,
    "strMeasure13" => nil,
    "strMeasure14" => nil,
    "strMeasure15" => nil,
    "strCreativeCommonsConfirmed" => "No",
    "dateModified" => "2017-09-07 21:42:09"
    }]

populator = PopulateDB.new(cocktail_info)
populator.populate_db
>>>>>>> 5a8b5be182545bc00032944309e2e63e18174fd0
