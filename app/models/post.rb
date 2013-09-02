class Post < ActiveRecord::Base
  include Votabulary
  include GenerateSlug

  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :classifications
  has_many :categories, through: :classifications
  has_many :comments

  validates :title, presence: true
  validates :url, presence: true

  after_validation :generate_slug

  def to_param
    self.slug
  end
end