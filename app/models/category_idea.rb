class CategoryIdea < ActiveRecord::Base
  belongs_to :idea
  belongs_to :category

end
