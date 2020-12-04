require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/venues/:id/events" do
    it 'Then I see each event that is associated with that venue with each events attributes' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      summer_splash = venue_1.events.create!(name: "Summer Splash")

      visit "/venues/#{venue_1.id}/events"

      expect(page).to have_content("Events for #{venue_1.name}")
      expect(page).to have_content(summer_jam.name)
      expect(page).to have_content(summer_splash.name)
    end
  end
end