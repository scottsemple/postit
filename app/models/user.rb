class User < ActiveRecord::Base
  include GenerateSlug

  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 3}

  after_validation :generate_slug

  def to_param
    self.slug
  end

  def admin?
    self.role == "admin"
  end
end