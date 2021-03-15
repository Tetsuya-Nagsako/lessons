class Remittance < ApplicationRecord
  validates :user_id, presence: true
  validates :bank_name, presence: true, length: { is: 4 }
  validates :branch_name, presence: true, length: { is: 3 }
  validates :deposit_type, presence: true, acceptance: true
  validates :account_holder, presence: true, length: { minimum: 1, maximum: 30}
  validates :bank_account_number, presence: true, length: { is: 7 }
  validates :transfer_money, presence: true, numericality: { only_integer: true }
  belongs_to :user
end
