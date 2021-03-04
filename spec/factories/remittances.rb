FactoryBot.define do
  factory :remittance do
    user_id { 1 }
    bank_name { 1 }
    branch_name { 1 }
    account_holder { "MyString" }
    bank_account_number { 1 }
    transfer_money { 1 }
  end
end
