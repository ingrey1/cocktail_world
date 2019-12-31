# {
#   idDrink: "17222",
#   strDrink: "A1",
#   strDrinkAlternate: null,
#   strDrinkES: null,
#   strDrinkDE: null,
#   strDrinkFR: null,
#   strDrinkZH-HANS: null,
#   strDrinkZH-HANT: null,
#   strTags: null,
#   strVideo: null,
#   strCategory: "Cocktail",
#   strIBA: null,
#   strAlcoholic: "Alcoholic",
#   strGlass: "Cocktail glass",
#   strInstructions: "Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.",
#   strInstructionsES: null,
#   strInstructionsDE: "Alle Zutaten in einen Cocktailshaker geben, mischen und über Eis in ein gekühltes Glas servieren.",
#   strInstructionsFR: null,
#   strInstructionsZH-HANS: null,
#   strInstructionsZH-HANT: null,
#   strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
#   strIngredient1: "Gin",
#   strIngredient2: "Grand Marnier",
#   strIngredient3: "Lemon Juice",
#   strIngredient4: "Grenadine",
#   strIngredient5: null,
#   strIngredient6: null,
#   strIngredient7: null,
#   strIngredient8: null,
#   strIngredient9: null,
#   strIngredient10: null,
#   strIngredient11: null,
#   strIngredient12: null,
#   strIngredient13: null,
#   strIngredient14: null,
#   strIngredient15: null,
#   strMeasure1: "1 3/4 shot ",
#   strMeasure2: "1 Shot ",
#   strMeasure3: "1/4 Shot",
#   strMeasure4: "1/8 Shot",
#   strMeasure5: null,
#   strMeasure6: null,
#   strMeasure7: null,
#   strMeasure8: null,
#   strMeasure9: null,
#   strMeasure10: null,
#   strMeasure11: null,
#   strMeasure12: null,
#   strMeasure13: null,
#   strMeasure14: null,
#   strMeasure15: null,
#   strCreativeCommonsConfirmed: "No",
#   dateModified: "2017-09-07 21:42:09"
#   }
require 'pry'

class PopulateDB
  attr_reader :cocktail_data, :cocktails, :ingredients, :cocktail_ingredients

  def initialize(cocktail_data = [])
    @cocktail_data = cocktail_data
    @cocktails = []
    @ingredients = []
  end

  def build_cocktail(cocktail_info)
    new_cocktail = {
      "name" => cocktail_info["strDrink"],
      "instructions" => cocktail_info["strInstructions"],
    }

    self.cocktails << Cocktail.create(new_cocktail)
  end

  def build_ingredients(ingredient_info)
    15.times do |num|
      ingredient_name = ingredient_info["strIngredient" + (num + 1).to_s]
      if ingredient_name
        self.ingredients << Ingredient.create(name: ingredient_name)
      end
    end
  end

  def build_cocktails
    self.cocktail_data.each { |cocktail_info| build_cocktail(cocktail_info) }
  end

  def build_all_ingredients
    self.cocktail_data.each { |cocktail_info| build_ingredients(cocktail_info) }
  end

  def build_cocktail_ingredients
    self.cocktail_data.each do |cocktail_info|
      ingredient_names = cocktail_info.select { |key, value| value != nil && key.include?("strIngredient") }.values
      ingredient_amounts = cocktail_info.select { |key, value| value != nil && key.include?("strMeasure") }.values
      found_cocktail = cocktails.find { |c| c.name == cocktail_info["strDrink"] }
      ingredient_names.each_with_index do |ingredient_name, index|
        found_ingredient = ingredients.find { |i| i.name == ingredient_name }
        #binding.pry
        CocktailIngredient.create(cocktail: found_cocktail, ingredient: found_ingredient, amount: ingredient_amounts[index])
      end
    end
  end

  def populate_db
    build_cocktails()
    build_all_ingredients()
    build_cocktail_ingredients()
  end
end
