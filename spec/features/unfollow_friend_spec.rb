require 'rails_helper'

RSpec.feature "Unfollow Friends" do
  before do 
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Don")
    @thai = User.create(email: "tb@example.com", password: "password", first_name: "Thai", last_name: "Boe")

    login_as(@john)
    @following = Friendship.create(user: @john, friend: @thai)
  end

  scenario "if signed in succeeds" do
    visit "/"
    click_link "The Gym"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content("#{@thai.full_name} was unfollowed")
  end
end