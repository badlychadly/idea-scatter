class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :categories, through: :ideas
  validates_presence_of :username, :email
  validates :email, length: { minimum: 8 }, uniqueness: { case_sensitive: false }
  validates :username, length: { minimum: 3 }, uniqueness: { case_sensitive: false }





  def self.find_by_slug(slug)
    self.all.find{|obj| obj.slug == slug}
  end



  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def ideas_size
    self.ideas.size
  end

end
