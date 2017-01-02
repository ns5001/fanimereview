class AddReviewToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :review, :string
  end
end
