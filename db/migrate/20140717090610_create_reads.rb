class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|

      t.belongs_to :user
      t.belongs_to :book
      
      t.timestamps
    end
  end
end
