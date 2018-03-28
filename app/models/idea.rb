class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates_presence_of :content
  validates :content, length: { minimum: 6 }, uniqueness: { case_sensitive: false }
  validates :category, presence: true, on: [ :create, :update ],
    unless: Proc.new { |idea| Idea.exists?(idea.id) }


      def category_name
        self.category.name
      end

end
