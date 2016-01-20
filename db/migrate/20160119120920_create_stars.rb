class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :stars
      t.belongs_to :recipe, index:true
      t.timestamps
    end
  end
end
