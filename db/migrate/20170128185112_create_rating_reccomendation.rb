class CreateRatingReccomendation < ActiveRecord::Migration[5.0]
  def change
    create_table :rating_reccomendations do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.integer :rating_id
      t.string :message
    end
  end
end
