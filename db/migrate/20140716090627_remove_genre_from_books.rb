class RemoveGenreFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :genre
  end

  def down
    add_column :books, :genre, :string
  end
end
