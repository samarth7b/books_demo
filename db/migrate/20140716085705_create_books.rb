class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :string

      t.timestamps
    end
    #add_index :books, [:user_id, :created_at]
  end
end
