class User < ApplicationRecord
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true

  PASSWORD_REQUIREMENTS = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x

  validates :password, format: { with: PASSWORD_REQUIREMENTS, message: 'must contain at least one lowercase letter, one uppercase letter, one digit, and one special character' }

  has_secure_password
end
