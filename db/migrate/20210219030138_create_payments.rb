class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.integer :charge_id
      t.integer :charge_amount
      t.string :currency
      t.string :charge_description
      t.string :receipt_url
      t.integer :customer_id
      t.string :email
      t.datetime :payment_date

      t.timestamps
    end
  end
end
