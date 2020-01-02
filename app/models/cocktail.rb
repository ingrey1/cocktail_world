class Cocktail < ActiveRecord::Base
  
  has_many :ingredients, through: :cocktail_ingredients


  def ingredients 
    CocktailIngredient.where(ingredient: self)
  end
  
  
  
end 