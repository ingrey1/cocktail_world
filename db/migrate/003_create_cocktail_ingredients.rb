class CreateCocktailIngredients < ActiveRecord::Migration[5.2]
  def change 
    create_table :cocktail_ingredients do |t|
      t.string :amount
<<<<<<< HEAD
      t.belongs_to :cocktail
=======
      t.belongs_to :cocktail 
>>>>>>> 5a8b5be182545bc00032944309e2e63e18174fd0
      t.belongs_to :ingredient
    end 
  end
end