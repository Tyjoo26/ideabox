require 'rails_helper'

describe ' a guest can create a user account ' do
  scenario 'a visitor goes to home page and clicks create account' do
    visit '/'

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Log In")
    expect(page).to have_content("Create Account")

    click_on("Log In")
    expect(current_path).to eq(login_path)

    click_on("Create Account")
    expect(current_path).to eq(new_user_path)
  end
end
