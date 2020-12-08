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

    it 'has working nav bar links' do
      visit venues_new_path

      expect(page).to have_link("Bands")
      click_link "Bands"
      expect(current_path).to eq(bands_path)

      expect(page).to have_link("Members")
      click_link "Members"
      expect(current_path).to eq(members_path)

      expect(page).to have_link("Venues")
      click_link "Venues"
      expect(current_path).to eq(venues_path)

      expect(page).to have_link("Events")
      click_link "Events"
      expect(current_path).to eq(events_path)
    end
  end
end