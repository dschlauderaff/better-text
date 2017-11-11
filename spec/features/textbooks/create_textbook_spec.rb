require 'rails_helper'

feature 'Add a textbook' do
  scenario 'unable to create textbook unless logged in' do
    visit root_path
    click_link "Add a new textbook"
    expect(page).to have_content("Log in")
  end

  scenario 'able to create a textbook without specifying a course' do
    # 1 go to root route and find link to add textbook  
    login
    visit root_path
    # 2 click on link
    click_link "Add a new textbook"
    #fill in textbook fields
    fill_in 'textbook_title', with: "Biology"
    fill_in 'textbook_price', with: 25
    #submit form
    click_button 'Create Textbook'

    expect(page).to have_content('Biology')
    expect(page).to have_content('Unit cost: $25')
    expect(page).to have_content('No adoptions created')

  end
end