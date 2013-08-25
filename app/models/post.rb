class Post < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :classifications
  has_many :categories, through: :classifications
  has_many :comments
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :url, presence: true
end