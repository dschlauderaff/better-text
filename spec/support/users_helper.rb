module UserHelper
  def login(user)
    visit root_path
    click_link "Sign In"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  def logout(user)
    visit root_path
    click_link 'Sign Out'
  end

end