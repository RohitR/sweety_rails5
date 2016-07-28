describe 'sign up ' do
  it 'allows user to create account' do
    sign_up
    expect(page).to have_content("User was successfully created.")
  end

  it 'does not allow user to create account with invalid email' do
    sign_up(email:"demo-@@@email-.com")
    expect(page).to have_content("Invalid format")
  end

  it 'does not allow user to create account with invalid password_confirmation' do
    sign_up(password_confirmation:'wrong_password')
    expect(page).to have_content("doesn't match Password")
  end

end

def sign_up(opts={})
  visit root_path
  click_link "Sign up here"
  fill_in 'user_patient_full_name', with: opts[:full_name] ||"full_name"
  fill_in 'user_patient_email', with: opts[:email] ||"demo@example.com"
  fill_in 'user_patient_username', with: opts[:username] ||"username"
  fill_in "user_patient_password", with: opts[:password]|| 'password'
  fill_in "user_patient_password_confirmation", with: opts[:password_confirmation]|| 'password'

  click_button 'Sign Up'
end
