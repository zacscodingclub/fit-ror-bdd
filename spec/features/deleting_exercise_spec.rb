require 'rails_helper'

RSpec.feature "Deleting Exercise"  do  

  before do
    @owner = User.create(email: "owner@example.com", password: "password", first_name: "Bob", last_name: "boB")
    @owner_exer = @owner.exercises.create!(name: "Snatch",
                                      work_sets: "6x1x95",
                                        details: "Smooth", 
                                   workout_date: Time.now)

    login_as(@owner)
  end

  scenario "A user deletes an article" do
    visit "/"
    click_link "The Gym"

    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Delete']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise was deleted")

  end
end