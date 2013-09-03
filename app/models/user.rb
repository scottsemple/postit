class User < ActiveRecord::Base
  include GenerateSlug

  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 3}

  after_validation :generate_slug

  def two_factor_auth?
    !self.phone.blank?
  end

  def generate_pin!
    self.update_column(:pin, rand(10 ** 6))
  end

  def remove_pin!
    self.update_column(:pin, nil)
  end

  def send_pin_to_twilio
    account_sid = 'ACe7be8f6a7e98458ea504e2d4c51d8ca1'
    auth_token = 'a640eac89a72352e8849afb153551597'

    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new(account_sid, auth_token)

    msg = "Your Postit verification code is #{self.pin}"
    account = client.account
    message = account.sms.messages.create({:from => '6475600330',
      :to => '+14036780507', :body => msg})
  end

  def to_param
    self.slug
  end

  def admin?
    self.role == "admin"
  end
end