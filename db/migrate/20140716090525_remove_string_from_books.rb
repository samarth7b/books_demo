class RemoveStringFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :string
  end

  def down
    add_column :books, :string, :string
  end
end
