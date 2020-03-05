class User < ApplicationRecord
  has_secure_password
  after_initialize :set_activated
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  def set_activated
    self.activated = true if self.new_record?
  end
end