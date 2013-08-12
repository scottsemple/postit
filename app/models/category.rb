class Category < ActiveRecord::Base
  has_many :classifications
  has_many :posts, through: :classifications

  validates :name, presence: true
end