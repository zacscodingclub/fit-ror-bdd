require 'rails_helper'

RSpec.feature "Show Friend Workouts" do
  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    @sara = User.create(email: "sara@example.com", password: "password", first_name: "Sara", last_name: "Doe")
    login_as(@john)

    @e1 = @john.exercises.create(name: "Snatch", work_sets: "5x2x85", details: "Very well", workout_date: "2015-11-14")
    @e2 = @sara.exercises.create(name: "C&J", work_sets: "5x2x105", details: "EMOM, no misses", workout_date: "2015-11-13")

    @following = Friendship.create(user: @john, friend: @sara)
  end

  scenario "displays list of friends workouts" do
    visit "/"
    click_link "The Gym"
    click_link @sara.full_name

    expect(page).to have_content("#{@sara.full_name}'s Recent Workouts")
    expect(page).to have_content(@e2.name)
    expect(page).to have_content(@e2.work_sets)
    expect(page).to have_content(@e2.details)
    expect(page).to have_content(@e2.workout_date)
    expect(page).to have_css("div#chart")
  end
end