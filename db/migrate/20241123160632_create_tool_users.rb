class CreateToolUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :tool_users do |t|
      t.string :name, null: false, comment: "Name of the tool user"
      t.string :email, null: false, comment: "Email of the tool user"
      t.string :password_digest, null: false, comment: "Password digest for authentication"
      t.string :profile_picture_url, comment: "Cloudinary URL for profile image"
      t.string :role, comment: "User role (e.g., admin, staff)"

      t.timestamps
    end
  end
end
