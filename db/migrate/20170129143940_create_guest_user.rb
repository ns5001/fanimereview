class CreateGuestUser < ActiveRecord::Migration[5.0]
  def change
    create_table :guest_users do |t|
      t.string :username
      t.string :email
      t.string :name
    end
  end
end
