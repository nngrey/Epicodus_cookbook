class Recipe < ActiveRecord::Base
  validates :name, :contents, presence: true
  has_and_belongs_to_many :tags
  has_many :stars
  belongs_to :contributor

  def rating
    rating = 0
    if self.stars.any?
      rating = self.stars.inject(0.0) { |sum, el| sum + el.rating } / self.stars.size
    end
    rating
  end
end

