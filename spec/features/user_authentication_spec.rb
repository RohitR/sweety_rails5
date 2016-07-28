describe 'user authentication' do
  it 'allows sign in with valid credentials' do
    sign_user_in(create(:patient_user))
    expect(page).to have_content('User was successfully signed in.')
  end

  it 'does not allow sign in with invalid credentials' do
    sign_user_in(create(:patient_user), password: 'wrong_pw')
    expect(page).to have_content('Invalid credentials')
  end

  it 'allows user sign out' do
    sign_user_in(create(:patient_user))
    expect(page).to have_content('User was successfully signed in.')

    visit root_path
    click_link 'Sign out'
    expect(page).to have_content('Logged out')
  end


end

def sign_user_in(user, opts={})
  visit new_welcome_path
  fill_in 'inputEmail', with: user.email
  fill_in 'Password', with: (opts[:password] || user.password)
  click_button 'login'
end
