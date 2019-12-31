class RunCocktailWorld

  def greeting

  puts
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts "} Welcome to Cocktail World! {"
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "Press 1 to search for a cocktail by name"
  puts "Press 2 to search for a cocktail by ingredient"
  puts "Press 3 to see all the cocktails"
  puts "Press 4 to see all the ingredients"
  puts "Press 5 for a surprise cocktail"
  puts "Type exit to quit"
  end

  def run 

  end

  def retrieve_cocktails_by_name
    
  end

  def retrieve_cocktails_by_ingredient

  end

  def all_cocktails
    Cocktail.all.map do |cocktail|
      cocktail.name
    end
  end

  def all_ingredients
    Ingredient.all.map do |ingredient|
      ingredient.name
    end
  end

  def select_random_cocktail

  end
end

