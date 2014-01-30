class User < ActiveRecord::Base
  attr_accessible :email
  before_save :encrypt_password

  validates_confirmation_of :password
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true

  def password
    @password
  end

  def password=(password_str)
    @password = password_str
  end

  def password_confirmation
    @password_confirmation
  end

  def password_confirmation=(password_confirmation_str)
    @password_confirmation = password_confirmation_str
  end

  def encrypt_password
    if :password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
