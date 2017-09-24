require 'rails_helper.rb'

RSpec.feature "purchase" do
	
  background do
    user = create(:user)
    sign_in_with user
  end

  scenario "Add Purchsed Items to generate bill split" do
    visit expenses_path
    fill_in 'purchase[date_purchased]', with: '09/19/2017'
    fill_in 'purchase[location]', with: 'Mumbai'
    fill_in 'purchase[cost]', with: 50
    find("#hidden_user_id", :visible => false).value
    find('#purchase_event_id', visible: true).set 1
    click_button('Add Bills', exact: true)
    expect(page).to have_content("Your Active Credits")
  end

  scenario "must sign in to generate bill split" do
    click_link "Sign Out"
    visit '/'
    expect(page).to_not have_content('Add a new Bill.')
    visit expenses_path
    expect(page).to have_content("You must sign in or sign up")
  end

  scenario "bill fields required" do
    click_link 'Add Bills'
    click_button 'Add Bills'
    expect(page).to have_content("Date purchased can't be blank")
    expect(page).to have_content("Cost can't be blank")
    expect(page).to have_content("Location can't be blank")
  end

  scenario "cost can't be negative" do
    click_link 'Add Bills'
    fill_in 'purchase[cost]', with: '-200'
    click_button 'Add Bills'
    expect(page).to have_content("Cost must be greater than or equal to 1")
  end
end