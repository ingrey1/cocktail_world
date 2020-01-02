
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
