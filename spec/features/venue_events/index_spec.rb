require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/venues/:id/events" do
    it 'Then I see each event that is associated with that venue with each events attributes' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      summer_splash = venue_1.events.create!(name: "Summer Splash")

      visit "/venues/#{venue_1.id}/events/"

      expect(page).to have_content("Events for #{venue_1.name}")
      expect(page).to have_content(summer_jam.name)
      expect(page).to have_content(summer_splash.name)
    end

    it 'Shows me the total amount of' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      summer_splash = venue_1.events.create!(name: "Summer Splash")

      visit "/venues/#{venue_1.id}/events/"

      expect(page).to have_content("Total: #{venue_1.events.event_count}")
    end

    it "I can click on the 'Sort alphabetically' to sort events" do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      summer_splash = venue_1.events.create!(name: "Summer Splash")
      another_jam = venue_1.events.create!(name: "Another Jam")
      another_splash = venue_1.events.create!(name: "Another Splash")

      visit "/venues/#{venue_1.id}/events"

      save_and_open_page
      
      expect(summer_jam.name).to appear_before(summer_splash.name)
      expect(summer_splash.name).to appear_before(another_jam.name)
      expect(another_jam.name).to appear_before(another_splash.name)

      expect(page).to have_link("Sort alphabetically")

      click_on "Sort alphabetically"
      
      expect(current_path).to eq("/venues/#{venue_1.id}/events/")

      expect(page).to have_content(summer_jam.name)
      expect(page).to have_content(summer_splash.name)
      expect(page).to have_content(another_jam.name)
      expect(page).to have_content(another_splash.name)
      
      expect(another_jam.name).to appear_before(another_splash.name)
      expect(another_splash.name).to appear_before(summer_jam.name)
      expect(summer_jam.name).to appear_before(summer_splash.name)
    end
  end
end