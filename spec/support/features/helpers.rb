module Features
  module Helpers
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

    def build_textbook(title, price)
      visit root_path
      click_link "Add a new textbook"
      fill_in 'textbook_title', with: title
      fill_in 'textbook_price', with: price
    end

    def build_course(name, enrollment)
      visit root_path
      click_link "Add a new course"
      fill_in 'course_name', with: name
      fill_in 'course_enrollment', with: enrollment
    end
  end
end