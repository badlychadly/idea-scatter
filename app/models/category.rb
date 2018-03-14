class Category < ActiveRecord::Base
  has_many :category_ideas
  has_many :ideas, through: :category_ideas
  has_many :items, through: :category_ideas
  has_many :users, through: :category_ideas
  validates_presence_of :name

end
