class DropTableGuestUser < ActiveRecord::Migration[5.0]
  def up
    drop_table :guest_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
