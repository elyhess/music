require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit the events show page' do
    it 'I can see all of the events and the events attributes' do
      venue_1 = Venue.create!(name: 'Great Stage Park', capacity: 90000, outdoor: true)

      summer_jam = venue_1.events.create!(name: "Summer Jam")

      visit "/events/#{summer_jam.name}"

      expect(page).to have_content(summer_jam.name)
    end
  end
end