class Ingredient < ActiveRecord::Base
  has_many :ingredients, through: :cocktail_ingredients

  def cocktails
    CocktailIngredient.where(ingredient: self)
  end

  def cocktail_count
    cocktails.count
  end

  def cocktail_names
    cocktails.map { |cocktail| cocktail.name }
  end

  
end
