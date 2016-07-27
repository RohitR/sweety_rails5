class SignIn < ActiveType::Object
  attribute :email, :string
  attribute :password, :string
  validate :validate_user_exists
  validate :validate_password_correct

  def user
    User.find_by(['email=? or username=?', email, email]) if email.present?
  end

  private

  def validate_user_exists
    errors.add(:user_id, 'not found') if user.blank?
  end

  def validate_password_correct
    if user && !user.authenticate(password)
      errors.add(:password, 'Incorrect password')
  end
end
end
