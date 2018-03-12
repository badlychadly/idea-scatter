class CategoryIdea < ActiveRecord::Base
  belongs_to :idea
  belongs_to :category
  belongs_to :item

end
