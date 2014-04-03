class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  validates :contents, :presence => true
  belongs_to :contributor

end

