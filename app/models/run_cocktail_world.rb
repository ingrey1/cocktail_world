require "pry"

class RunCocktailWorld
  def initialize
    #call run()
  end

  def greeting
    puts
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "} Welcome to Cocktail World! {"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" #MAYBE CHANGE THIS TO MAKE A BIT SIMPLER - IE user_input only once
    puts "Press 1 to search for a cocktail by name"
    puts "Press 2 to search for a cocktail by ingredient"
    puts "Press 3 for a surprise cocktail"
    puts "Type exit to quit"
  end

  def run
    while true
      greeting()
      user_input = gets.strip

      if user_input == "1"
        puts "Enter the name of a cocktail"
        # get_user_input function
        user_cocktail = gets.strip
        # retrieve_cocktail_info function
        cocktail = retrieve_cocktail_by_name(user_cocktail)
        puts cocktail
        # display_cocktail function(after testing)
        puts
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts
        puts "Enter 1 to return to main menu"
        puts "Enter exit to quit"
        user_choice1 = gets.strip
        if user_choice1 == "1"
          continue
        else
          break
        end
      elsif user_input == "2"
        puts "Enter the name of an Ingredient"
        user_ingredient = gets.strip
        cocktails_by_ingredient = retrieve_cocktails_by_ingredient(user_ingredient)
        puts cocktails_by_ingredient
        puts
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts
        puts "Enter 1 to return to the main menu"
        puts "Enter exit to quit"
        user_choice2 = gets.strip
        if user_choice2 == "1"
          continue
        else
          break
        end
      elsif user_input == "3"
        random_cocktail = select_random_cocktail()
        puts random_cocktail
        puts
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts
        puts "Enter 1 to return to the main menu"
        puts "Enter exit to quit"
        user_choice3 = gets.strip
        if user_choice3 == "1"
          continue
        else
          break
        end
      else
        break
      end
    end
  end

  def retrieve_cocktail_by_name(name)
    cocktail = Cocktail.find_by(name: name)
    if !cocktail
      return nil
    end
    # cocktail_ingredients = CocktailIngredient.all.select do |cocktail_ingredient|
    #   cocktail_ingredient.cocktail == cocktail
    # end

    cocktail_ingredients = CocktailIngredient.where(cocktail: cocktail)

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
    # search Ingredients by ingredient name

    find_ingredient = Ingredient.all.find { |ingredient| ingredient.name == name }
    cocktail_ingredients_by_ingredient = CocktailIngredient.all.select do |cocktail_ingredient|
      cocktail_ingredient.ingredient == find_ingredient
    end

    ingredient_cocktails = CocktailIngredient.all.select do |cocktail_ingredient|
      cocktail_ingredient.ingredient == find_ingredient
    end

    cocktails_with_ingredient = ingredient_cocktails.map do |cocktails_ingredients|
      cocktails_ingredients.cocktail
    end

    cocktails_with_ingredient.map do |cocktail|
      retrieve_cocktail_by_name(cocktail.name)
    end
  end

  def make_cocktail(name, instruction, ingredients_arr, amounts_arr)
    # binding.pry
    new_cocktail = { name: name, instructions: instruction, ingredients: {} }
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

  def select_random_cocktail
    random_cocktail = Cocktail.all.sample
    #sample a random cocktail
    retrieve_cocktail_by_name(random_cocktail.name)
    # call retrieve_cocktail_by_name
  end
end
