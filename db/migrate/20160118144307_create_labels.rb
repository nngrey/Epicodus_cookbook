class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
