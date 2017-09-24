require 'rails_helper.rb'

RSpec.feature "sessions" do
  scenario "displays the home page after successful sign in" do

    visit new_user_session_url
    fill_in 'user[email]', with: 'amar@example.com'
    fill_in 'user[password]', with: 'abcd1234'

    click_button('Log in', exact: true)
  end
end