require 'rails_helper'

RSpec.feature "Following Friends" do
  before do 
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Don")
    @thai = User.create(email: "tb@example.com", password: "password", first_name: "Thai", last_name: "Boe")

    login_as(@john)
  end

  scenario "if signed in succeeds" do
    visit "/"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@thai.full_name)
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@john.id}")

    link = "a[href='/friendships?friend_id=#{@thai.id}']"
    find(link).click

    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@thai.id}")
  end
end