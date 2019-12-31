class RunCocktailWorld

  def greeting

  puts
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts "} Welcome to Cocktail World! {"
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "Press 1 to search for a cocktail by name"
  puts "Press 2 to search for a cocktail by ingredient"
  puts "Press 3 for a surprise cocktail"
  puts "Type exit to quit"

  end

  def run 
    #while true
    # display menu
    # get user input, save to variable
    # if user said 1, call method 1
    # elsif user said 2.....
    #elsif exit, break
  end

  def retrieve_cocktail_by_name(name)
  # get cocktail obj
  # # get arr of ingredients and amounts for cocktail object
  # call make_cocktail, pass that information in,
  # return the made cocktail
  end

  def retrieve_cocktails_by_ingredient

  end

  def all_cocktails
    Cocktail.all.map do |cocktail|
      retrieve_cocktail_by_name(cocktail.name)
    end
    
  end

  def make_cocktail(name, instructions, ingredients_arr, amounts_arr)
    new_cocktail = { name: name, instructions: instructions, ingredients: {} }
    new_cocktail_ingredients = new_cocktail[:ingredients]
      ingredients_arr.each_with_index do |key, index|  
        new_cocktail_ingredients[key] = amounts_arr[index]
    # iterate through ingredients_arr, populate ingredient as key
      end
    # corresponding amount at ssame index as value
  end

  def all_ingredients
    array = []
      Ingredient.all.map do |ingredient|
        array << ingredient.name 
      end
    array.uniq
  end

  def select_random_cocktail
   random_cocktail = Cocktail.all.sample
  end
end

