class Ingredient < ActiveRecord::Base
  has_many :ingredients, through: :cocktail_ingredients

  def cocktails
    CocktailIngredient.all.select { |ci| ci.ingredient == self }.map { |ci| ci.cocktail }
  end

  def cocktail_count
     cocktails.count
  end 

  def cocktail_names
    cocktails.map {|cocktail| cocktail.name}
  end 

end
