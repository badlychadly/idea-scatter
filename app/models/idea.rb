class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates_presence_of :content
  validates :content, uniqueness: true

end
