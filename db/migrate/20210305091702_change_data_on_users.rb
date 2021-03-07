class ChangeDataOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :star, false
    change_column_null :users, :sales, false
    change_column :users, :star, :float, default: 0
    change_column :users, :sales, :integer, default: 0
  end
end
