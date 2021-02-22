class RenameCreditcardColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :creditcard, :sales
  end
end
