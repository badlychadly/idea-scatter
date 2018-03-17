class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :categories, through: :ideas
  validates_presence_of :username, :email
  validates :email, uniqueness: true



  def self.find_by_slug(slug)
    self.all.find{|obj| obj.slug == slug}
  end



  def slug
    self.username.downcase.gsub(" ", "-")
  end
end

end
