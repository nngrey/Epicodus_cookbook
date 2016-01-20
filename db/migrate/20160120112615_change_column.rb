class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :stars, :stars, :float
  end
end
