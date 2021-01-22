class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  # それぞれのtopicは1つのuserを持つ
  belongs_to :user
  # topicは複数のfavoriteを持つ
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  
  # topicは複数のcommentを持つ
  has_many :comments
  has_many :comment_users, through: :comments, source: 'user'
  
  mount_uploader :image, ImageUploader
end
