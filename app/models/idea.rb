class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates_presence_of :content

end
