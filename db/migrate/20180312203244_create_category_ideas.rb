class CreateCategoryIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :category_ideas do |t|
      t.integer :category_id
      t.integer :idea_id
      t.integer :item_id
    end
  end
end
