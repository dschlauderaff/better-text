require 'rails_helper'

feature 'Add a textbook' do
  scenario 'unable to create textbook unless logged in' do
    visit root_path
    click_link "Add a new textbook"
    expect(page).to have_content("Log in")
  end

  scenario 'able to create a textbook without specifying a course' do
    login
    build_textbook('Biology', 25)

    #submit form
    click_button 'Create Textbook'

    expect(page).to have_content('Biology')
    expect(page).to have_content('Unit cost: $25')
    expect(page).to have_content('No adoptions created')
  end

  scenario 'able to create a textbook and a new course' do
    login
    build_textbook('Biology', 25)
    fill_in 'textbook_courses_attributes_name', with: "Science"
    fill_in 'textbook_courses_attributes_enrollment', with: 200
    click_button 'Create Textbook'

    expect(page).to have_content('Biology')
    expect(page).to have_content('Unit cost: $25')
    expect(page).to have_content('Science')
    expect(page).to have_content('200 students')
  end
  
  scenario 'able to create a textbook and adopt to an existing course' do
    login
    Course.create(name: 'Science', enrollment: 200)
    build_textbook('Biology', 25)
    check('Science')
    click_button 'Create Textbook'

    expect(page).to have_content('Biology')
    expect(page).to have_content('Unit cost: $25')
    expect(page).to have_content('Science')
    expect(page).to have_content('200 students')
  end

  scenario 'able to create textbook and adopt to multiple existing courses' do
    login
    Course.create(name: 'Science', enrollment: 200)
    Course.create(name: 'Math', enrollment: 40)
    build_textbook('Biology', 25)
    check('Science')
    check 'Math'
    click_button 'Create Textbook'

    expect(page).to have_content('Biology')
    expect(page).to have_content('Unit cost: $25')
    expect(page).to have_content('Science')
    expect(page).to have_content('200 students')
    expect(page).to have_content('Math')
    expect(page).to have_content('40 students')
  end

  scenario 'able to create a textbook, adopt to existing course and new course' do
    login
    Course.create(name: 'Math', enrollment: 40)
    build_textbook('Biology', 25)
    fill_in 'textbook_courses_attributes_name', with: "Science"
    fill_in 'textbook_courses_attributes_enrollment', with: 200
    check 'Math'
    click_button 'Create Textbook'

    expect(page).to have_content('Biology')
    expect(page).to have_content('Unit cost: $25')
    expect(page).to have_content('Science')
    expect(page).to have_content('200 students')
    expect(page).to have_content('Math')
    expect(page).to have_content('40 students')
  end
end