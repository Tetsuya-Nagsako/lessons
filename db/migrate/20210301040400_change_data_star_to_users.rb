class ChangeDataStarToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :star, :float
  end
end
