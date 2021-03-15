class Payment < ApplicationRecord
  validates :user_id, presence: true
  validates :lesson_id, presence: true
  validates :charge_amount, presence: true
  validates :charge_description, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  belongs_to :user
  belongs_to :lesson
end
