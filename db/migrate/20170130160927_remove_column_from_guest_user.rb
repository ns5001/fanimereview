class RemoveColumnFromGuestUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :guest_users, :email, :string
  end
end
