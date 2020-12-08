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
    
    it 'each event has an edit link' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      
      visit "/events"

      expect(current_path).to eq("/events")
      expect(page).to have_link("Edit")

      click_link("Edit")

      expect(current_path).to eq("/events/#{summer_jam.id}/edit")
    end

    it 'each event has an delete link which removes the venue' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      
      visit "/events"

      expect(current_path).to eq("/events")
      expect(page).to have_link("Delete")

      click_link("Delete")

      expect(current_path).to eq("/events")
      expect(page).to_not have_content(summer_jam.name)
    end

    it 'Each event has a link to its show page' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      summer_splash = venue_1.events.create!(name: "Summer Splash")

      visit "/events"
      click_link 'Summer Jam'

      expect(current_path).to eq("/events/#{summer_jam.id}")

      visit "/events"
      click_link 'Summer Splash'

      expect(current_path).to eq("/events/#{summer_splash.id}")
    end

  end
end