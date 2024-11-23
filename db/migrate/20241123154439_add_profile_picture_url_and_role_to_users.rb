class AddProfilePictureUrlAndRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_picture_url, :string
    add_column :users, :role, :string
    add_column :users, :name, :string
  end
end
