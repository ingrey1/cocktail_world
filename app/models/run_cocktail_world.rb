require "pry"

class RunCocktailWorld

  def greeting
    puts
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "} Welcome to Cocktail World! {"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" #MAYBE CHANGE THIS TO MAKE A BIT SIMPLER - IE user_input only once
    puts "Press 1 to search for a cocktail by name"
    puts "Press 2 to search for a cocktail by ingredient"
    puts "Press 3 for a surprise cocktail"
    puts "Press 4 for cocktail stats"
    puts "Enter exit to quit"
  end # simple greeting menu

  def run
    while true
      greeting()
      user_input = gets.strip.downcase

      #menu case 1; search by cocktail name
      if user_input == "1"
        puts "Enter the name of a cocktail"
        # get_user_input function
        user_cocktail = gets.strip.downcase
        # retrieve_cocktail_info function
        cocktail = retrieve_cocktail_by_name(user_cocktail)
        if !cocktail
          put_tilda_25_times
          3.times {puts "We don't have that cocktail!"}
          put_tilda_25_times
          next
        end
        display_cocktail(cocktail)
        display_return_menu 
        user_choice1 = gets.strip.downcase
        if user_choice1 == "1"
          next
        elsif user_choice1 == 'exit'
          break
        else 
          puts
          9.times {puts "#{user_choice1} is an Invalid command!"}
          next
        end

        #menu case 2; search for cocktails with certain ingredient
      elsif user_input == "2"
        puts "Enter the name of an Ingredient"
        user_ingredient = gets.strip.downcase
        cocktails_by_ingredient = retrieve_cocktails_by_ingredient(user_ingredient)
        puts
        puts "The cocktails with #{user_ingredient} are :"
        puts
        cocktail_names = []
        cocktails_by_ingredient.each do |cocktail|
          cocktail_names.push(cocktail[0][:name])
          # outputs cocktail_names
        end
        if cocktail_names.length < 1 
          puts 'we dont have the ingredient in any drinks, sorry!'
        end
      
        puts cocktail_names
        puts 
        put_tilda_25_times
        display_return_menu
        
        user_choice2 = gets.strip.downcase
        if user_choice2 == "1"
          next
        elsif user_choice2 == 'exit'
          break
        else 
          puts
          9.times {puts "#{user_choice2} is an Invalid command!"}
          next
        end

        #menu case 3; search for a random cocktail
      elsif user_input == "3"
        random_cocktail = select_random_cocktail()
        display_cocktail(random_cocktail)
        display_return_menu
        user_choice3 = gets.strip.downcase
        if user_choice3 == "1"
          next
        elsif user_choice3 == 'exit'
          break
        else 
          puts
          9.times {puts "#{user_choice3} is an Invalid command!"}
          next
        end

        #menu case 4; output some cocktail stats
      elsif user_input == '4'
        puts "There are #{Cocktail.all.count} cocktails and #{Ingredient.all.count} ingredients."
        puts "Here are the most used cocktail ingredients:\n\n"
        Ingredient.display_popular(10)
        sleep 2
      elsif user_input == "exit"
        break
      else
       puts
       put_tilda_25_times
       9.times {puts "#{user_input} is an Invalid command!"}
        next
      end
    end
  end

  def retrieve_cocktail_by_name(name)
    cocktail = Cocktail.find_by(name: name) #find cocktail by name
    if !cocktail
      return nil
    end

    cocktail_ingredients = CocktailIngredient.where(cocktail: cocktail)# find CocktailIngredients by cocktail

    ingredient_names = cocktail_ingredients.map do |cocktail_ingredient|
      cocktail_ingredient.ingredient.name # get ingredient names for making a cocktail
    end

    ingredient_amounts = cocktail_ingredients.map do |cocktail_ingredients|
      cocktail_ingredients.amount #get ingredient amounts for make cocktail
    end

    made_cocktail = make_cocktail(cocktail.name, cocktail.instructions, ingredient_names, ingredient_amounts)
    made_cocktail
  end


  def retrieve_cocktails_by_ingredient(name)
    # search Ingredients by ingredient name
    cocktail_array = []

    find_ingredient = Ingredient.find_by(name: name) # find CocktailIngredient that match ingredient
    cocktail_ingredients_by_ingredient = CocktailIngredient.where(ingredient: find_ingredient)

    cocktails_with_ingredient = cocktail_ingredients_by_ingredient.map do |cocktails_ingredients|
    cocktails_ingredients.cocktail # get the Cocktail instances with ingredients from CocktailIngredients
    end

    cocktails_with_ingredient.map do |cocktail|
      array_of_cocktails = []
      x = retrieve_cocktail_by_name(cocktail.name)
      array_of_cocktails.push(x)
      array_of_cocktails # show the names of the cocktails with wanted ingredient
    end
  end
  
  def make_cocktail(name, instruction, ingredients_arr, amounts_arr)
    # create an instance of a cocktail in the form we want
    new_cocktail = { name: name, instructions: instruction, ingredients: {} }
    new_cocktail_ingredients = new_cocktail[:ingredients]
    ingredients_arr.each_with_index do |key, index|
      new_cocktail_ingredients[key] = amounts_arr[index]
    end
    new_cocktail
  end

  def display_cocktail(cocktail)
    
      puts "You have asked for : \n #{put_tilda_25_times}"
      puts "cocktail name: #{cocktail[:name]}\n\n"
      puts "instructions for making: #{cocktail[:instructions]}\n\n"
      puts "ingredients: \n\n"
      cocktail[:ingredients].each do |name, amount|
        puts "\t#{name}: #{amount} "   
      end
      puts
      put_tilda_25_times
    end

  def select_random_cocktail
    random_cocktail = Cocktail.all.sample
    #sample a random cocktail
    retrieve_cocktail_by_name(random_cocktail.name)
    # call retrieve_cocktail_by_name
  end

  def put_tilda_25_times
    puts "~" * 25
  end

  def display_return_menu
        puts "\nEnter 1 to return to main menu"
        puts "Enter exit to quit"
  end
end
