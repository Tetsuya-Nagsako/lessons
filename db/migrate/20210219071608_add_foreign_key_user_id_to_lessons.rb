class AddForeignKeyUserIdToLessons < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :lessons, :users, column: :bought_user
  end
end
