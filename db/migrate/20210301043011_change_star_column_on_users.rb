class ChangeStarColumnOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :star, :float, null: false, default: 0
  end
end
