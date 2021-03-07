class ChangeDataToRemittance < ActiveRecord::Migration[5.2]
  def change
    change_column :remittances, :bank_name, :text
    change_column :remittances, :branch_name, :text
    change_column :remittances, :bank_account_number, :text
    add_column :remittances, :deposit_type, :string
  end
end
