class Ingredient < ActiveRecord::Base
  has_many :ingredients, through: :cocktail_ingredients

  def cocktail_ingredients
    CocktailIngredient.where(ingredient: self)
  end

  def cocktails 
     cocktail_ingredients.map {|ci| ci.cocktail}
  end 

  def cocktail_count
    cocktails.count
  end

  def cocktail_names
    cocktails.map { |cocktail| cocktail.name }
  end

  def percent_cocktail_use
    
  end 

  
end
