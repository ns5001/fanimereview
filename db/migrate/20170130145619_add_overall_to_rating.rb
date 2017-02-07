class AddOverallToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :overall, :integer
  end
end
