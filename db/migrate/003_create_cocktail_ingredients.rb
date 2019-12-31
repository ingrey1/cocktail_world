class CreateCocktailIngredients < ActiveRecord::Migration[5.2]
  def change 
    create_table :cocktail_ingredients do |t|
      t.string :amount
      t.belongs_to :cocktail 
      t.belongs_to :ingredient
    end 
  end
end