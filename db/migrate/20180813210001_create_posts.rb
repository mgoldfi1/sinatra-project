class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :user_rating
      t.integer :movie_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
