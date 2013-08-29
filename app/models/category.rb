class Category < ActiveRecord::Base
  has_many :classifications
  has_many :posts, through: :classifications

  validates :name, presence: true

  after_validation :generate_slug

  def generate_slug
    self.slug = self.name.gsub(' ', '-').downcase
  end

  def to_param
    self.slug
  end
end