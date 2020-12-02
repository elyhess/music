require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit /bands' do
    it 'I click a link to add a new band' do

      visit "/bands"
      click_link "New Band"
      expect(current_path).to eq("/bands/new")
      fill_in 'Name', with: 'Tyler Childers'
      check 'Booked'
      click_on 'Submit'

      expect(current_path).to eq("/bands")
      expect(page).to have_content("Tyler Childers")
      
    end
  end
end