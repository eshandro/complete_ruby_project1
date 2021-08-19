class User < ApplicationRecord
  has_many :articles

  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 5 }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEXP =  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEXP }

  has_secure_password
end