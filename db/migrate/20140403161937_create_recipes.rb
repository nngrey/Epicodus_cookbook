class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :name, :string
      t.column :name, :string
      t.column :contributor_id, :integer

      t.timestamps
    end
  end
end
