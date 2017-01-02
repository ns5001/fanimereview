class CreateAnime < ActiveRecord::Migration[5.0]
  def change
    create_table :animes do |t|
      t.string :name
      t.string :pic
    end
  end
end
