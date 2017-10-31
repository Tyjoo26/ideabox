require 'rails_helper'

describe 'a user can create a new idea' do
  it 'user sees form and can create a new idea' do

    current_user = User.create!(username: "ElTigre", password: "test", role: 0)
    @category = Category.create!(title: "Football", id: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

    visit new_user_idea_path(current_user)

    fill_in "idea[name]", with: "PatriotProofFootball"
    fill_in "idea[content]", with: "A self-inflating football"
    select(@category.title, :from => 'idea[category_id]')
    click_on "Submit Idea"
    expect(current_path).to eq("/users/#{current_user.id}/ideas/#{Idea.last.id}")

    expect(page.status_code).to eq(200)
    expect(page).to have_content("PatriotProofFootball")
  end


end
