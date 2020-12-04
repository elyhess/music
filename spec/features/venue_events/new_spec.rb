require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/venues/:id/events/new" do
    it 'I am able to add a new event to the specific venue' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      summer_splash = venue_1.events.create!(name: "Summer Splash")

      visit "/venues/#{venue_1.id}/events"
      click_link "New Event"

      expect(current_path).to eq("/venues/#{venue_1.id}/events/new")

      fill_in 'Name', with: 'event100'
      click_button "Create Event"

      expect(current_path).to eq("/venues/#{venue_1.id}/events")

      expect(page).to have_content("Events for #{venue_1.name}")
      expect(page).to have_content('event100')
    end
  end
end