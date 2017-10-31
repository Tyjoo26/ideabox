require 'rails_helper'

describe ' a visitor can log into  a user account ' do
  scenario 'by going to home page and clicking Log In' do
    visit '/'

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Log In")
    expect(page).to have_content("Create an Account")

    click_on("Log In")
    expect(current_path).to eq(login_path)
  end
end

describe 'a visitor can create an account' do
  scenario 'by going to home page and clicking create account' do
    visit '/'

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Log In")
    expect(page).to have_content("Create an Account")


  click_on("Create an Account")
  expect(current_path).to eq(new_user_path)
end
end
