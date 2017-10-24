require 'rails_helper'

describe 'user can create a new category' do
  before :each do
    visit new_category_path
  end

  it ' a user can create a new category through a form' do
    expect(page.status_code).to eq(200)
    fill_in 'category[title]', with: "Technology"
    click_on "Submit"
    expect(current_path).to eq("/categories/#{Category.last.id}")

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Technology")
  end
end
