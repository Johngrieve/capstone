class User < ApplicationRecord
  has_many :accounts

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
