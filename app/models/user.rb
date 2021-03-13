class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  validates :sales, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
         
  has_many :lessons, dependent: :destroy
  has_many :payments
  has_many :payment_lessons, through: :payments, source: 'lesson'
  has_many :comments, dependent: :destroy
  has_many :remittance
end
