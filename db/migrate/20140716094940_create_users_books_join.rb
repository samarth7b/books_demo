class CreateUsersBooksJoin < ActiveRecord::Migration
  def up
  	create_table 'users_books', :id => false do |t|
      #t.column :user_id, :integer
      #t.column :book_id, :integer
      t.belongs_to :user
      t.belongs_to :book
  	end
  	add_index :users_books, [:user_id, :book_id]
  end

  def down
  	drop_table :users_books
  end
end
