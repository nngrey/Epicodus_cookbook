class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
