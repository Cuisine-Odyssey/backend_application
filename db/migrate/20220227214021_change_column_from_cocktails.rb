class ChangeColumnFromCocktails < ActiveRecord::Migration[5.2]
  def change
    rename_column :cocktails, :cocktail_id, :cocktail_api_id
  end
end
