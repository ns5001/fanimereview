class CreateRating < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :plot
      t.integer :character
      t.integer :art
    end
  end
end
