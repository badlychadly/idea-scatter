class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :category_ideas
  has_many :categories, -> { distinct }, through: :category_ideas
  has_many :items, -> { distinct }, through: :category_ideas
  validates_presence_of :username, :email
  validates :email, uniqueness: true

end
