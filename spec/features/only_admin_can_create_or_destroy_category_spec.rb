require 'rails_helper'

describe 'admin can create a new category' do
  it ' a admin can create a new category through a form' do
    admin_user = User.create(username: "Dingles",
                             password: "pass",
                             role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

    visit admin_categories_path
    expect(page).to have_content("Admin Categories")

    click_on "Create Category"
    expect(current_path).to eq(new_admin_category_path)
    expect(page.status_code).to eq(200)
    fill_in 'category[title]', with: "Social Capital"
    click_on "Submit"
    expect(current_path).to eq(admin_categories_path)

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Technology")
  end

  # it 'an admin can destroy a new category' do
  #   click_on("Delete Category")
  #   expect(current_path).to eq(admin_categories_path)
  #   expect(page).to have_content("You've deleted your category!")
  # end
end
