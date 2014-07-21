class CreateToreads < ActiveRecord::Migration
  def change
    create_table :toreads do |t|

      t.belongs_to :user
      t.belongs_to :book

      t.timestamps
    end

    add_index :toreads, :user_id
    add_index :toreads, :book_id
    add_index :toreads, [:user_id, :book_id], unique: true
  end
end
