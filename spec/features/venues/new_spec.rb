require 'rails_helper'

describe 'As a visitor' do
  describe 'when im on /venues' do
    it 'I can click a link to add a new venue' do

      visit '/venues'
      click_link "New Venue"

      expect(current_path).to eq('/venues/new')

      fill_in 'Name', with: 'Red Rocks'
      fill_in 'Capacity', with: 10000
      check 'Outdoor'

      click_on 'Submit'
      expect(current_path).to eq('/venues')
      expect(page).to have_content("Red Rocks")
    end
  end
end