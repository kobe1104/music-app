class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  attr_reader :password

  after_initialize :ensure_session_token

  has_many(
    :bands,
    class_name: "Band",
    foreign_key: :user_id,
    primary_key: :id
  )



  def self.generate_session_token
     SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    self.save
  end

  def is_password?(password)
    bc_password = BCrypt::Password.new(self.password_digest)
    bc_password.is_password?(password)
  end

end
