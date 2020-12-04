require 'rails_helper'

describe 'As a visitor' do
  describe 'when i am on an events show page' do
    it 'I can update its information' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      
      visit "/events/#{summer_jam.id}"

      click_link 'Edit'

      expect(current_path).to eq("/events/#{summer_jam.id}/edit")
      
      fill_in 'Name', with: 'winter jam'
      click_on 'Update Info'

      expect(current_path).to eq("/events/#{summer_jam.id}")
      expect(page).to have_content("winter jam")
    end
  end
end


