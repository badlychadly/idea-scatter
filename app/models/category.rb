class Category < ActiveRecord::Base
  has_many :ideas
  has_many :users, through: :ideas
  before_validation :normalize_name, on: :create
  validates_presence_of :name
  validates :name, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

  def idea_count
    self.ideas.size
  end


  private
    def normalize_name
      self.name = name.downcase.titleize
    end


end
