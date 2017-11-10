require 'rails_helper'



feature "Visitor signs up" do
  scenario 'Signs up with valid email and password' do
    sign_up_with 'valid@email.com', 'please123'
    
    expect(page).to have_content('Sign Out')
  end
  
  scenario 'Cannot sign up with invalid email' do
    sign_up_with 'invalid_email', 'please123'
    
    expect(page).to have_content('Sign up')
  end
  
  scenario 'Cannot signup with invalid password' do
    sign_up_with 'valid@email.com', 'short'
    
    expect(page).to have_content('Sign up')
  end
end

#   As a user
#   I want to sign in
#   So I can visit protected areas of the site

feature 'Sign in' do
  
  scenario 'user cannot sign in if not registered' do
    visit root_path
    click_link "Sign In"
    fill_in 'user_email', with: 'valid@email.com'
    fill_in 'user_password', with: 'test123'
    click_button 'Log in'
    
    expect(page).to have_content("Log in")
  end
  
  scenario 'User can sign in with valid credentials' do
    user = FactoryBot.create(:user)
    sign_in(user.email, user.password)

    expect(page).to have_content("Sign Out")
  end

  scenario 'User cannot sign in with wrong email' do
    user = FactoryBot.create(:user)
    sign_in('invalid@email.com', user.password)
    
    expect(page).to have_content('Log in')
  end

  scenario 'User cannot sign in with wrong password' do
    user = FactoryBot.create(:user)
    sign_in(user.email, 'invalidpass')

    expect(page).to have_content('Log in')
  end
end
  