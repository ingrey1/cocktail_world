
require "pry"

class PopulateDB
  attr_reader :cocktail_data, :cocktails, :ingredients, :cocktail_ingredients

  def initialize(cocktail_data = [])
    @cocktail_data = cocktail_data
    @cocktails = []
    @ingredients = []
  end

  def build_cocktail(cocktail_info)
    # create cocktail and save it to db
    new_cocktail = {
      "name" => cocktail_info["strDrink"].downcase,
      "instructions" => cocktail_info["strInstructions"].downcase,
    }
    # save cocktail to db
    self.cocktails << Cocktail.create(new_cocktail)
  end

  def build_ingredients(ingredient_info)
    # create ingredient objects and save them to db
    15.times do |num|
      ingredient_name = ingredient_info["strIngredient#{num + 1}"]
      if ingredient_name
        ingredient_name = ingredient_name.downcase
        # save cocktail to db
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
    # create cocktail_ingredients and save them to db
    self.cocktail_data.each do |cocktail_info|
      ingredient_names = cocktail_info.select { |key, value| value != nil && key.include?("strIngredient") }.values
      ingredient_names.map! { |name| name.downcase }
      ingredient_amounts = cocktail_info.select { |key, value| value != nil && key.include?("strMeasure") }.values
      ingredient_amounts.map! { |amount| amount.downcase }
      found_cocktail = cocktails.find { |c| c.name == cocktail_info["strDrink"].downcase }
      ingredient_names.each_with_index do |ingredient_name, index|
        found_ingredient = ingredients.find { |i| i.name == ingredient_name }
        # save the cocktail_ingredients to db
        CocktailIngredient.create(cocktail: found_cocktail, ingredient: found_ingredient, amount: ingredient_amounts[index])
      end
    end
  end

  def populate_db
    # populate db with cocktails, ingredients, and cocktail_ingredients
    build_cocktails()
    build_all_ingredients()
    build_cocktail_ingredients()
  end
end
