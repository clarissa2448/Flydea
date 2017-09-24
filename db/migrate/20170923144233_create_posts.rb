class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
        t.string :category
        t.text :idea
        t.text :tags
        t.string :first_name
        t.string :last_name
        t.boolean :anonymous
        t.integer :likes
        t.integer :dislikes
        t.timestamps null: false
    end
  end
end
