class Lesson < ApplicationRecord
  validates :description, presence: true, length: { minimum: 1, maximum: 200}
  validates :price, presence: true
  validates :time_information, presence: true

  belongs_to :user

  mount_uploader :image, ImagesUploader
  
  def lesson_time
    self.time_information.strftime("%Y/%m/%d %H:%M")
  end
  
end
