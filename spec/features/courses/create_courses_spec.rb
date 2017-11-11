require 'rails_helper'

feature 'Create a course' do
  scenario 'unable to create course unless logged in' do
    visit root_path
    click_link "Add a new course"
    expect(page).to have_content("Log in")
  end

  scenario 'able to create a course without specifying a textbook' do
    login
    build_course('Science', 200)
    click_button 'Create Course'

    expect(page).to have_content('Science')
    expect(page).to have_content('Students enrolled: 200')
    expect(page).to have_content('No adoptions created')
  end

  scenario 'able to create a course and a new textbook' do
    login
    build_course('Science', 200)
    fill_in 'course_textbooks_attributes_title', with: 'Biology'
    fill_in 'course_textbooks_attributes_price', with: 25
    click_button 'Create Course'

    expect(page).to have_content('Science')
    expect(page).to have_content('Students enrolled: 200')
    expect(page).to have_content('Biology')
    expect(page).to have_content('$25')
  end

  scenario 'able to create a course and adopt an existing textbook' do
    login
    Textbook.create(title: 'Biology', price: 25)
    build_course('Science', 200)
    check 'Biology'
    click_button 'Create Course'

    expect(page).to have_content('Science')
    expect(page).to have_content('Students enrolled: 200')
    expect(page).to have_content('Biology')
    expect(page).to have_content('$25')
  end

  scenario 'able to create course and adopt multiple existing textbooks' do
    login
    Textbook.create(title: 'Biology', price: 25)
    Textbook.create(title: 'Algebra', price: 45)
    build_course('Science', 200)
    check 'Biology'
    check 'Algebra'
    click_button 'Create Course'

    expect(page).to have_content('Science')
    expect(page).to have_content('Students enrolled: 200')
    expect(page).to have_content('Biology')
    expect(page).to have_content('$25')
    expect(page).to have_content('Algebra')
    expect(page).to have_content('$45')
  end

  scenario 'able to create a course, adopt existing textbook and new textboo' do
    login
    Textbook.create(title: 'Algebra', price: 45)
    build_course('Science', 200)
    fill_in 'course_textbooks_attributes_title', with: 'Biology'
    fill_in 'course_textbooks_attributes_price', with: 25
    check 'Algebra'
    click_button 'Create Course'

    expect(page).to have_content('Science')
    expect(page).to have_content('Students enrolled: 200')
    expect(page).to have_content('Biology')
    expect(page).to have_content('$25')
    expect(page).to have_content('Algebra')
    expect(page).to have_content('$45')
  end
end