require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit /events' do
    it 'Then I see each event in the system including the events attributes' do
      red_rocks = Venue.create(name: "red rocks", capacity: 11000, outdoor: true)
      blue_rocks = Venue.create(name: "blue rocks", capacity: 1100, outdoor: false)

      event_1 = red_rocks.events.create(name: "event1")
      event_2 = blue_rocks.events.create(name: "event2")

      visit '/events'
      
      expect(page).to have_content(event_1.name)
      expect(page).to have_content(event_2.name)
    end
  end
end


