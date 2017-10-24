require 'rails_helper'

describe 'a user can create a new idea' do
  before :each do
    @category = Category.create!(title: "Football", id: 1)

    visit new_idea_path
  end

  it 'user sees form and can create a new idea' do
    fill_in "idea[name]", with: "PatriotProofFootball"
    fill_in "idea[content]", with: "A self-inflating football"
    select(@category.title, :from => 'idea[category_id]')
    click_on "Submit Idea"
    expect(current_path).to eq("/ideas/#{Idea.last.id}")

    expect(page.status_code).to eq(200)
    expect(page).to have_content("PatriotProofFootball")
  end


end
