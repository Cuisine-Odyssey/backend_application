class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.integer :cocktail_id

      t.timestamps
    end
  end
end
