require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit /events' do
    it 'I see each event in the system including the events attributes' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      summer_splash = venue_1.events.create!(name: "Summer Splash")

      visit '/events'

      expect(page).to have_content("Events")
      expect(page).to have_content(summer_jam.name)
      expect(page).to have_content(summer_splash.name)
    end 
  end
end