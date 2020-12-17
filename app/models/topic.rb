class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  # それぞれのtopicは1つのuserを持つ
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
