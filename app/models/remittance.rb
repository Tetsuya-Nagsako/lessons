class Remittance < ApplicationRecord
  validates :user_id, presence: true
  validates :bank_name, presence: true
  validates :branch_name, presence: true
  validates :account_holder, presence: true
  validates :bank_account_number, presence: true
  validates :transfer_money, presence: true #2万円までとかにしよう
  belongs_to :user
end
