require 'pry'
class RunCocktailWorld

def initialize

end

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
    while true do 
      greeting()
      user_input = gets.strip

      if user_input == "1"
        # get_user_input function
        # retrieve_cocktail_info function
        # display_cocktail function
        # continue
        
      end
    end
    # display menu
    # get user input, save to variable
    # if user said 1, call method 1
    # elsif user said 2.....
    #elsif exit, break
  end

  def retrieve_cocktail_by_name(name)
    cocktail = Cocktail.all.find { |cocktail| cocktail.name == name }
  
     cocktail_ingredients = CocktailIngredient.all.select do |cocktail_ingredient|
        cocktail_ingredient.cocktail == cocktail
     end
     
     ingredient_names = cocktail_ingredients.map do |cocktail_ingredient|
      cocktail_ingredient.ingredient.name
     end
    
     ingredient_amounts = cocktail_ingredients.map do |cocktail_ingredients|
    
      cocktail_ingredients.amount
     end
   
  made_cocktail = make_cocktail(cocktail.name, cocktail.instructions, ingredient_names, ingredient_amounts)
  made_cocktail
  end

  def retrieve_cocktails_by_ingredient(name)


  end

  # def all_cocktails
  #   Cocktail.all.map do |cocktail|
  #     retrieve_cocktail_by_name(cocktail.name)
  #   end
    
  # end

  def make_cocktail(name, instructions, ingredients_arr, amounts_arr)
    # binding.pry
    new_cocktail = { name: name, instructions: instructions, ingredients: {} }
    new_cocktail_ingredients = new_cocktail[:ingredients]
      ingredients_arr.each_with_index do |key, index|  
        new_cocktail_ingredients[key] = amounts_arr[index]
      end
    new_cocktail
  end

  def display_cocktail(cocktail)
    cocktail.each do |cocktail|
      puts "You have asked for : "
      puts "~" * 20

      puts cocktail[:name]
      puts cocktail[:ingredients]
      puts 
      puts cocktail[:instructions]

      puts "~" * 20
    end
  end

  # def all_ingredients
  #   array = []
  #     Ingredient.all.map do |ingredient|
  #       array << ingredient.name 
  #     end
  #   array.uniq
  # end

  def select_random_cocktail
   random_cocktail = Cocktail.all.sample
  end
end

