class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :recipe_id, :recipe_api_id
  end
end
