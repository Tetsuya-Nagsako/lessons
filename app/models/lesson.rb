class Lesson < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 30}
  validates :description, presence: true, length: { minimum: 1, maximum: 200}
  validates :price, presence: true
  validates :time_information, presence: true

  belongs_to :user
  has_one :payment
  has_one :payment_user, through: :payment, source: 'user'
  has_many :comments

  mount_uploader :image, ImagesUploader
  
  def lesson_time
    self.time_information.strftime("%Y/%m/%d %H:%M")
  end
  
end
