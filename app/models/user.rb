class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  validates_presence_of :username, :email
  validates :email, uniqueness: true

end
