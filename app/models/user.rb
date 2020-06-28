class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { self.email = self.email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, {
    presence: true,
    length: { maximum: 50 },
  })
  has_secure_password
  validates(:password, {
    presence: true,
    length: { maximum: 10 },
    allow_nil: true,
  })
  validates(:email, {
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 50 },
    format: { with: VALID_EMAIL_REGEX },
  })

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
