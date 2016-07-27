class User::AsSignUp < ActiveType::Record[User]
  attribute :password
  attribute :password_confirmation
  validates :password, presence: true, confirmation: true
  validates :terms, acceptance: true
end
