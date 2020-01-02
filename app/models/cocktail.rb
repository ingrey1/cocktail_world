class Cocktail < ActiveRecord::Base
  has_many :ingredients, through: :cocktail_ingredients

  def cocktail_ingredients
    CocktailIngredient.where(ingredient: self)
  end

  def ingredients
    cocktail_ingredients.map { |ci| ci.ingredient }
  end

  def ingredients_count
    ingredients.size
  end

  def ingredient_names
    ingredients.map { |ingredient| ingredient.name }
  end
end
