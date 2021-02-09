class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.string :description
      t.string :image
      t.datetime :time_information

      t.timestamps
    end
  end
end
