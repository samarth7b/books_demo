class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|

      t.belongs_to :user
      t.belongs_to :book
      
      t.timestamps
    end

    add_index :reads, :user_id
    add_index :reads, :book_id
    add_index :reads, [:user_id, :book_id], unique: true
  end
end
