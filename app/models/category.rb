class Category < ActiveRecord::Base
  include GenerateSlug

  has_many :classifications
  has_many :posts, through: :classifications

  validates :name, presence: true

  after_validation :generate_slug

  def to_param
    self.slug
  end
end