class Lesson < ApplicationRecord
  validates :title,  length: { minimum: 1, maximum: 30}
  validates :description,  length: { minimum: 1, maximum: 200}
  validates :price, presence: true
  validate :only_100_multiple
  def only_100_multiple
    if price.blank? || price % 100 != 0
      errors.add(:price, ": 価格付けは100円単位でお願いします")
    end
  end
  validates :time_information, presence: true

  belongs_to :user
  has_one :payment
  has_one :payment_user, through: :payment, source: 'user'
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImagesUploader
  
  def lesson_time
    self.time_information.strftime("%Y/%m/%d %H:%M")
  end
  
end
