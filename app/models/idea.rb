class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :category_ideas
  has_many :categories, through: :category_ideas

end
