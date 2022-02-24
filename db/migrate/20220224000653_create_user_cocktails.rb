class CreateUserCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cocktails do |t|
      t.references :user, foreign_key: true
      t.references :cocktail, foreign_key: true
      t.integer :vote

      t.timestamps
    end
  end
end
