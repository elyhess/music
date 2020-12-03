require 'rails_helper'

describe 'description' do
  describe 'description' do
    it 'does something' do
      venue_1 = Venue.create(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create(name: "Summer Jam")
      summer_splash = venue_1.events.create(name: "Summer Splash")

      visit "/venues/#{venue_1}/events"

      expect(page).to have_content(summer_jam.name)
      expect(page).to have_content(summer_splash.name)
    end
  end
end