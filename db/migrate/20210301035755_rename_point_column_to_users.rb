class RenamePointColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :point, :star
  end
end
