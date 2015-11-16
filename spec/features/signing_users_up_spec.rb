require 'rails_helper'

RSpec.feature "Users signup" do
  scenario "with valid credentials" do
    visit "/"
    click_link "Join Us!"

    fill_in "Email", with: "user@example.com"
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign Up"

    expect(page).to have_content("You have successfully signed up!")
    expect(page).to have_content("John Doe")
  end
end