class Comment < ActiveRecord::Base
  include Votabulary

  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  belongs_to :post

  validates :content, presence: true
end