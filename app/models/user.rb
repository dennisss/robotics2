class User < ActiveRecord::Base
  before_save { self.name = name.downcase }
  before_create :create_remember_token
  attr_accessible :name, :password, :password_confirmation, :email
  validates :name, presence: true, uniqueness: true
	validates :email, email_format: { message: "doesn't look like an email address" }, presence: true, uniqueness: true
  has_secure_password
	has_many :posts

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

	private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
