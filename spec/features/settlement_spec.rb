require 'rails_helper.rb'

feature 'Deleting a charge:' do

  background do
    user = create(:user)
    sign_in_with user
    visit expenses_path
    create(:purchase)
  end
  
  scenario 'can delete a charge via the debt listing page' do
    visit debt_url
    expect(page).to have_content("Your Debt Summary:")
  end
end 