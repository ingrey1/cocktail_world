require_relative "../config/environment.rb"

if Cocktail.all.count < 25 # local db hasnt yet been populated, so populate it
  data = GetData.new
  all_cocktails = data.simplify_the_cocktail_data_structure
  popDB = PopulateDB.new(all_cocktails)
  popDB.populate_db
end

# run the game
runner = RunCocktailWorld.new
result = runner.retrieve_cocktail_by_name("A1")
puts result

binding.pry
