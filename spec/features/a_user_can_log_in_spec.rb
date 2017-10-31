require 'rails_helper'

describe 'a user can create an account ' do
  before :each do
    @user = User.create!(username: "TheMan", password: "test")
  end
  scenario 'user visits home page, can create account'do
    visit '/'

    click_on "Create an Account"

    expect(current_path).to eq(new_user_path)

    fill_in :Username, with: "Dingles"
    fill_in :Password, with: "test"

    click_on "Create User"

    expect(page).to have_content("Welcome, Dingles!")
  end

  scenario ' a user can log in an account' do
    visit '/'

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :Username, with: "TheMan"
    fill_in :Password, with: "test"

    click_on "Log In"


  end
end
