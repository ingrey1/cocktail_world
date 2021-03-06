class Ingredient < ActiveRecord::Base
  has_many :ingredients, through: :cocktail_ingredients

  def cocktail_ingredients
    CocktailIngredient.where(ingredient: self)
  end

  def cocktails
    cocktail_ingredients.map { |ci| ci.cocktail }
  end

  def cocktail_count
    cocktails.count
  end

  def cocktail_names
    cocktails.map { |cocktail| cocktail.name }
  end

  def percent_cocktail_use
    (cocktail_count * 1.0 / Cocktail.all.count * 100).round(2)
  end

  def display_percent_cocktail_use
    puts "#{self.name}: #{percent_cocktail_use}\%"
  end 

  def self.most_popular

    self.all.sort_by {|ingredient| -ingredient.percent_cocktail_use}
    
  end
  
  def self.display_popular(limit)
    self.most_popular.first(limit).each {|ingredient| ingredient.display_percent_cocktail_use } 
  end 

  def self.ingredients_by_name(ingredient_name)
    Ingredient.where("name like ?", "%#{ingredient_name}%")
  end
 
end
