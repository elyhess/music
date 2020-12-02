require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit /venues' do
    it 'I click a link to add a new venue' do

      visit "/venues"
      click_link "New Venue"
      expect(current_path).to eq("/venues/new")

      fill_in 'Name', with: 'red rocks'
      fill_in 'Capacity', with: 900000
      check 'Outdoor'

      click_on 'Submit'

      expect(current_path).to eq("/venues")
      expect(page).to have_content("red rocks")
      
    end
  end
end