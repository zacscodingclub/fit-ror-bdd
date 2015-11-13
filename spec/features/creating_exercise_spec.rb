require 'rails_helper'

RSpec.feature "Creating Exercise" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "with valid inputs" do
    visit '/'
    click_link "The Gym"
    click_link "Add Workout"
    expect(page).to have_link("Back")

    fill_in "Exercise", with: "Snatch"
    fill_in "Work Sets", with: "10x1x90kg"
    fill_in "Details", with: "EMOM, no misses"
    fill_in "Date", with: "2015-11-12"
    click_button "Add Workout"

    expect(page).to have_content("Your workout was added.")

    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@john, exercise))
  end

  scenario "with invalid inputs" do
    visit '/'
    click_link "The Gym"
    click_link "Add Workout"

    expect(page).to have_link("Back")

    fill_in "Exercise", with: nil
    fill_in "Work Sets", with: ""
    fill_in "Date", with: ""
    click_button "Add Workout"

    expect(page).to have_content("Workout couldn't be added.  Please try submitting it again.")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Work sets can't be blank")
    expect(page).to have_content("Details can't be blank")
    expect(page).to have_content("Workout date can't be blank")
  end
end