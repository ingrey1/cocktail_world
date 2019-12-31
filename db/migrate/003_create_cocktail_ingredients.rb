class CreateCocktailIngredients < ActiveRecord::Migration[5.2]
  def change 
    create_table :cocktail_ingredients do |t|
      t.string :amount
      t.belongs_to :cocktail_id 
      t.belongs_to :ingredient_id
    end 
  end
end