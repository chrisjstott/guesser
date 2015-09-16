require 'rails_helper'

feature "guesser", js: true do

  scenario "works when all inputs are filled" do
    visit root_path

    fill_in 'person_height', with: "70"
    fill_in 'person_weight', with: "150"
    click_on "Submit!"

    expect(page).to have_content "My guess is"
    
    click_on "Yes"
    
    expect(page).to have_content "Awesome!"
  end
  
  scenario "does not continue when some inputs are not filled"
    visit root_path
    
    fill_in 'person_height', with: "70"
    
    click_on "Submit!"
    
    expect(page).to_not have_content "My guess is"
  end

end