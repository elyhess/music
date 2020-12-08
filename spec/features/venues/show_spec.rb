require 'rails_helper'


describe 'As a visitor' do
  describe 'When i visit /venues/:id' do
    it 'I see the venue with that id including the venues attributes:' do
      red_rocks = Venue.create!(name: "red rocks", capacity: 11000, outdoor: true)
      blue_rocks = Venue.create!(name: "blue rocks", capacity: 4551, outdoor: false)

      visit "/venues/#{red_rocks.id}"

      expect(page).to have_content(red_rocks.name)
      expect(page).to have_content(red_rocks.capacity)
      expect(page).to have_content(red_rocks.outdoor)

      expect(page).to_not have_content(blue_rocks.name)
      expect(page).to_not have_content(blue_rocks.capacity)
      expect(page).to_not have_content(blue_rocks.outdoor)

      expect(page).to have_link("Edit")
      expect(page).to have_link("Delete")
    end

    it 'allows me to delete a venue' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)
  
      visit "/venues/#{venue_1.id}"

      click_link 'Delete Venue'

      expect(current_path).to eq('/venues')
      expect(page).to_not have_content(venue_1.name)
    end

    it 'I can click a link that takes me to the venue events index page' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)
  
      visit "/venues/#{venue_1.id}"

      click_link "#{venue_1.name}'s Events"

      expect(current_path).to eq("/venues/#{venue_1.id}/events")
    end

    it 'has working nav bar links' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)
      visit venues_show_path(venue_1.id)

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