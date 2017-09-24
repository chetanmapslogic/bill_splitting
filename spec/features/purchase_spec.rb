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
    find('#purchase_event_id', visible: true).set 1
    # find(:css, ".check_boxes[value='2']").set(true)

    # find(:id, '#purchase_user_ids_2', visible: true).set 1
    # find('#purchase_user_ids_2', visible: false).set 'foo bar'
    

    # click_button('Add Bills', exact: true)
    # expect(page).to have_content("You have signed up successfully")
  end
end