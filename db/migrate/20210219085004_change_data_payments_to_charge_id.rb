class ChangeDataPaymentsToChargeId < ActiveRecord::Migration[5.2]
  def change
    change_column :payments, :charge_id, :string
    change_column :payments, :customer_id, :string
  end
end
