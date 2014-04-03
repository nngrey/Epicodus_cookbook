class AddColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :contents, :text
  end
end
