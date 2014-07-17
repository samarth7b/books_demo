class AddReviewedAndReviewIdToReads < ActiveRecord::Migration
  def change
    add_column :reads, :reviewed, :boolean
    add_column :reads, :review_id, :integer
  end
end
