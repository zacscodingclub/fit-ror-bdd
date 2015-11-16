require 'rails_helper'

RSpec.feature "Editing Exercises" do
  
  before do
    @owner = User.create(email: "owner@example.com", password: "password", first_name: "Bob", last_name: "boB")
    @owner_exer = @owner.exercises.create!(name: "Snatch",
                                      work_sets: "6x1x95",
                                        details: "Smooth", 
                                   workout_date: Time.now)

    login_as(@owner)
  end

  scenario "with valid inputs succeeds" do
    visit "/"
    click_link "The Gym"

    link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
    find(link).click

    fill_in "Work Sets", with: "5x1x100"
    click_button "Update Workout"

    expect(page).to have_content("Your workout was updated")
    expect(page).to have_content("5x1x100")
    expect(page).not_to have_content("6x1x95")
  end

  scenario "with invalid inputs fails" do
    visit "/"
    click_link "The Gym"

    link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
    find(link).click

    fill_in "Work Sets", with: ""
    click_button "Update Workout"

    expect(page).to have_content("Your workout couldn't be updated")
    expect(page.current_path).to eq(edit_user_exercise_path(@owner, @owner_exer))
  end
end