class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 1, maximum: 100}
  
  belongs_to :user
  belongs_to :lesson
end
