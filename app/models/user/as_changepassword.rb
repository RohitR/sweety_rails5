class User::AsChangepassword < ActiveType::Record[User]
  attribute :old_password
  before_save :validate_old_password_correct

  private

  def validate_old_password_correct
    errors.add(:old_password, 'Incorrect') unless authenticate(old_password)
  end
end
