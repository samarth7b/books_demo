class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :book_title
      t.string :review_title
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :reviews, [:user_id, :created_at]
  end
end
