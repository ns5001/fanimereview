class AddReccomendationToAnime < ActiveRecord::Migration[5.0]
  def change
    add_column :animes, :reccomendations, :integer, default: 0
  end
end
