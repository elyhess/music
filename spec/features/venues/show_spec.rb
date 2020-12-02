require 'rails_helper'


describe 'As a visitor' do
  describe 'When i visit /venues/:id' do
    it 'I see the venue with that id including the venues attributes:' do
      red_rocks = Venue.create(name: "red rocks", capacity: 11000, outdoor: true)
      blue_rocks = Venue.create(name: "blue rocks", capacity: 1100, outdoor: false)

      visit "/venues/#{red_rocks.id}"
      expect(page).to have_content(red_rocks.name)
      expect(page).to have_content(red_rocks.capacity)
      expect(page).to have_content(red_rocks.outdoor)
      expect(page).to_not have_content(blue_rocks.name)
    end

    it 'allows me to delete a venue' do
      red_rocks = Venue.create(name: "red rocks", capacity: 11000, outdoor: true)
      blue_rocks = Venue.create(name: "blue rocks", capacity: 1100, outdoor: false)

      visit "/venues/#{red_rocks.id}"
      click_link "Remove Band"

      expect(current_path).to eq("/venues")
      expect(page).to_not have_content(red_rocks.name)
      expect(page).to have_content(blue_rocks.name)
    end
  end
end