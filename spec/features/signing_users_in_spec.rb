require 'rails_helper'

RSpec.feature "User signs in" do
  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
  end

  scenario "with valid credentials" do
    visit "/"
    click_link "Log In"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log In"

    expect(page).to have_content("You are now signed in.")
    expect(page).to have_content("Signed in as #{@john.email}")
  end
end