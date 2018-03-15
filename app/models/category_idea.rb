class CategoryIdea < ActiveRecord::Base
  belongs_to :idea
  belongs_to :category
  belongs_to :item
  belongs_to :user
  validates_presence_of :user_id, :category_id

end
