class RenameUserToToolUser < ActiveRecord::Migration[7.0]
  def change
    rename_table :users, :tool_users
  end
end
