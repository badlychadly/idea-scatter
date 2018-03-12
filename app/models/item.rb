class Item < ActiveRecord::Base
  has_many :category_ideas
  has_many :categories, through: :category_ideas
  has_many :ideas, through: :category_ideas

end
