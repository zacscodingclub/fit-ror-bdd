require 'rails_helper'

RSpec.feature "Listing Members" do
  
  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Password")
    @sara = User.create(email: "sara@example.com", password: "password", first_name: "Sara", last_name: "McSara")
  end

  scenario "Lists all users" do
    visit "/"

    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sara.full_name)
  end
end