class AddLikeToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :likes, :integer, default: 0
    add_column :ratings, :reccomendations, :integer, default: 0
    add_column :ratings, :anime_id, :integer
    add_column :ratings, :user_id, :integer
  end
end
