class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :category_ideas
  has_many :categories, through: :category_ideas
  has_many :items, through: :category_ideas
  validates_presence_of :username, :email
  validates :email, uniqueness: true

end
