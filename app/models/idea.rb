class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :category_ideas
  has_many :categories, through: :category_ideas, :source => :category
  has_many :items, through: :category_ideas
  validates_presence_of :content

end
