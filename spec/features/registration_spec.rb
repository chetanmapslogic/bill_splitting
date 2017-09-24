require 'rails_helper.rb'

RSpec.feature "users" do
  scenario "displays the home page after successful sign up" do

    visit new_user_registration_url
    
    fill_in 'user[username]', with: 'chetan'
    fill_in 'user[email]', with: 'amar@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_button('Sign up', exact: true)
    expect(page).to have_content("You have signed up successfully")
  end
end