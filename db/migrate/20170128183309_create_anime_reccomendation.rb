class CreateAnimeReccomendation < ActiveRecord::Migration[5.0]
  def change
    create_table :anime_reccomendations do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.integer :anime_id
      t.string :message
    end
  end
end
