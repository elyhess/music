require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit /events/:id' do
    it 'Then I see the event with that id including the events attributes' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")

      visit "/events/#{summer_jam.id}"

      expect(page).to have_content(summer_jam.name)
    end 

    it 'allows me to delete an event' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")
      winter_jam = venue_1.events.create!(name: "Winter Jam")

      visit "/events/#{summer_jam.id}"

      click_link 'Delete Event'

      expect(current_path).to eq('/events')

      expect(page).to_not have_content(summer_jam.name)
      expect(page).to have_content(winter_jam.name)
    end
  end
end