class RenameToolUsersToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :tool_users, :users
  end
end
