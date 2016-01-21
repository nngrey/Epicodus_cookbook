class Recipe < ActiveRecord::Base
  validates :name, :contents, presence: true
  has_and_belongs_to_many :tags
  has_many :stars
  belongs_to :contributor

  attr_reader

  def rating
    rating = 0
    if self.stars.any?
      rating = self.stars.inject(0.0) { |sum, el| sum + el.rating } / self.stars.size
    end
    rating
  end

  def self.custom_sort
    custom_count = Recipe.count > 5 ? 5 : Recipe.count - 2
    ordered_recipes = self.all.sort_by{ |recipe| recipe.created_at }
    new_recipes = ordered_recipes.pop(custom_count)
    best_recipes = ordered_recipes.sort_by{ |recipe| -recipe.rating }
    new_and_best = best_recipes.zip(new_recipes).flatten
  end

  def self.new_recipes
    ordered_recipes = self.all.sort_by{ |recipe| recipe.created_at }
    new_recipes = ordered_recipes.pop(5)
  end

end

