class Lesson < ApplicationRecord
  validates :description, presence: true, length: { minimum: 1, maximum: 100}
  validates :time_information, presence: true

  belongs_to :user

  mount_uploader :image, ImagesUploader
end
