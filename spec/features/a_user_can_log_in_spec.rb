require 'rails_helper'

describe 'a user can log in' do
  scenario 'user visits home page, has option to log in'do
    visit '/'

    click_on "Create an Account"

    expect(current_path).to eq(new_user_path)

    fill_in :Username, with: "Dingles"
    fill_in :Password, with: "test"

    click_on "Create User"

    expect(page).to have_content("Welcome, Dingles!")
  end
end
