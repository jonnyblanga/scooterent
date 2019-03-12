class RenameReviewToComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :review, :comment
  end
end
