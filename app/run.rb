require_relative "../config/environment.rb"



data = GetData.new
all_cocktails = data.simplify_the_cocktail_data_structure
puts all_cocktails.size
popDB = PopulateDB.new(all_cocktails)
popDB.populate_db
runner = RunCocktailWorld.new
result = runner.retrieve_cocktails_by_ingredient("Vodka")
puts result