class Category < ActiveRecord::Base
  has_many :ideas
  has_many :users, through: :ideas
  validates_presence_of :name
  validates :name, length: { minimum: 3 }, uniqueness: true


end
