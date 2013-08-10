class Post < ActiveRecord::Base
  belongs_to :user
  has_many :classifications
  has_many :categories, through: :classifications
end