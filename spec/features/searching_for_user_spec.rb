require 'rails_helper'

RSpec.feature "Searching for User" do
  
  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Password")
    @sara = User.create(email: "sara@example.com", password: "password", first_name: "Sara", last_name: "Password")
  end

  scenario "with existing name, returns all those users" do
    visit "/"

    fill_in "search_name", with: "Password"
    click_button "Search"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sara.full_name)
    expect(current_path).to eq("/dashboard/search")
  end
end