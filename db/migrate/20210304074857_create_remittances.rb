class CreateRemittances < ActiveRecord::Migration[5.2]
  def change
    create_table :remittances do |t|
      t.integer :user_id
      t.integer :bank_name
      t.integer :branch_name
      t.string :account_holder
      t.integer :bank_account_number
      t.integer :transfer_money

      t.timestamps
    end
  end
end
