class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :content
      t.integer :user_id
      t.integer :category_id
    end
  end
end
