class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles

  EMAIL_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: EMAIL_VALIDATION }

  has_secure_password
end
