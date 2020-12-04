require 'rails_helper'

describe 'As a visitor' do
  describe 'when i am on the venues show page' do
    it 'I can update its information' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      visit "/venues/#{venue_1.id}"

      click_link 'Edit'
      expect(current_path).to eq("/venues/#{venue_1.id}/edit")
      
      fill_in 'Name', with: 'redrocks'
      fill_in 'Capacity', with: 10000
      check 'Outdoor'

      click_on 'Update Info'

      expect(current_path).to eq("/venues/#{venue_1.id}")
      expect(page).to have_content("redrocks")
    end
  end
end