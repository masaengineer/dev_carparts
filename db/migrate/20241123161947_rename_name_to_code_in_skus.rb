class RenameNameToCodeInSkus < ActiveRecord::Migration[7.0]
  def change
    rename_column :skus, :name, :code
  end
end
