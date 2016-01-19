class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  validates :contents, :presence => true
  has_and_belongs_to_many :tags
  belongs_to :contributor
end

