class AddBoughtUserIdToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :bought_user, :bigint
  end
end
