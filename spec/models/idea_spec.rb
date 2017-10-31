require 'rails_helper'


RSpec.describe "Idea" do
  context "validation for" do
    it "creating a new idea" do
      default_user = User.create(username: "Dingles",
                                 password: "pass",
                                 role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      category = Category.create(title: "Sports")
      idea = Idea.create(name: "Self inflating football", content: "An automated self pumping football", category: category, user: default_user)

      expect(idea).to be_valid
    end

    it 'wont create a new idea without name attribute' do
      default_user = User.create(username: "Dingles",
                               password: "pass",
                               role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)


      category = Category.create(title: "Sports")
      idea = Idea.create(content: "An automated self pumping football", category: category, user: default_user)
      expect(idea).to be_invalid
    end

    it 'wont create a new idea without content attribute' do
      category = Category.create(title: "Sports")
      idea = Idea.create(name: "Self inflating footabll", category: category)
      expect(idea).to be_invalid
    end

    it 'wont create a new idea without a category id attribute' do
      idea = Idea.create(name: "Self inflating footabll", content: "BS")
      expect(idea).to be_invalid
    end

    it 'wont create a new idea without any attributes' do
      idea = Idea.create
      expect(idea).to be_invalid
    end
  end









end
