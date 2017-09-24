require 'rails_helper.rb'

feature 'Test home page links without login' do  
  
  scenario 'check Add bills link ' do
    visit '/'
    click_link "Add Bills"
    expect(page).to have_content('You must sign in or sign up.')
  end

  scenario 'check Debt Listings link' do
    visit '/'
    click_link "Debt Listings"
    expect(page).to have_content('You must sign in or sign up!!')
  end

  scenario 'check Login Link' do
    visit '/'
    click_link "Login"
    expect(page).to have_content('Log in')
  end

  scenario 'check Login Link' do
    visit '/'
    click_link "Register"
    expect(page).to have_content('Sign up')
  end
end 