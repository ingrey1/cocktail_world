class Ingredient < ActiveRecord::Base
  
    has_many :ingredients, through: :cocktail_ingredients

end 