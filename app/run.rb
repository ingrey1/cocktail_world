require_relative "../config/environment.rb"

#ata = GetData.new
#all_cocktails = data.simplify_the_cocktail_data_structure
#puts all_cocktails.size
#popDB = PopulateDB.new(all_cocktails)
#popDB.populate_db
runner = RunCocktailWorld.new
result = runner.retrieve_cocktail_by_name("A1")
puts result
