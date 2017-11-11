module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit root_path
      click_link "Sign Up"
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign up'
    end

    def sign_in(email, password)
      visit root_path
      click_link "Sign In"
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Log in'
    end

    def login
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
    end

  end
end