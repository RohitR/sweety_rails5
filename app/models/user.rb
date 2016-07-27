class User < ApplicationRecord
  has_many :blood_glucoses
  has_secure_password
  cattr_accessor :current

  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Invalid format' },
                    uniqueness: true
end
