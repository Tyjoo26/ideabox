describe "idea model tests" do
  context "can submit a valid ideas" do
    it 'user can submit a valid idea' do
      visit '/'
      click_link("Create Idea")
      expect(current_path).to eq(something here)

      fill_in()
    end
  end


  context "idea invalid tests" do

  end



end
