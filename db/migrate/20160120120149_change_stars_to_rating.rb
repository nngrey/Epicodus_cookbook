class ChangeStarsToRating < ActiveRecord::Migration
  def change
    rename_column :stars, :stars, :rating
  end
end
