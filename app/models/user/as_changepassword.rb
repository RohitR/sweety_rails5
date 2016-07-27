class User::AsChangepassword < ActiveType::Record[User]
  attribute :old_password
  before_save :validate_old_password_correct


  private
  def validate_old_password_correct

   if  !self.authenticate(self.old_password)
     errors.add(:old_password, 'Incorrect')
   end
  end





end
