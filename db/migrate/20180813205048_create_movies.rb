class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :review
      t.string :rating
      t.integer :user_id 
      t.timestamps null: false
    end
  end
end
