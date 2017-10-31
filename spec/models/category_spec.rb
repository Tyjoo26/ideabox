require 'rails_helper'

RSpec.describe "category" do
    context 'validates' do
      it 'existence of title' do
        category = Category.create

        expect(category).to be_invalid
      end

  end
end
