class RemoveUserIdFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :user_id, :referemces
  end
end
