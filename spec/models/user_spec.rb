require 'rails_helper'

describe 'user model validations' do
  it "user can be created as default user" do
    user = User.create(username: "User", password: "12345", role: 0)
    expect(user).to be_valid
    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end

  it "user can be created as an admin" do
    user = User.create(username: "User", password: "12345", role: 1)
    expect(user).to be_valid
    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end


  it "they are created as default user by default" do
    user = User.create(username: "User", password: "12345")
    expect(user).to be_valid
    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy

    user.admin!

    expect(user.role).to eq("admin")

    user.default!

    expect(user.role).to eq('default')
  end


end
