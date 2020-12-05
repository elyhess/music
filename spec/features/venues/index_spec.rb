require 'rails_helper'


describe 'As a visitor' do
  describe 'When i visit /venues' do
    it 'I see the name of each venue in the system' do
      red_rocks = Venue.create!(name: "red rocks", capacity: 11000, outdoor: true)
      blue_rocks = Venue.create!(name: "blue rocks", capacity: 1100, outdoor: false)

      visit '/venues'

      expect(page).to have_content(red_rocks.name)
      expect(page).to have_content(blue_rocks.name)
      expect(page).to have_content(red_rocks.date_added)
      expect(page).to have_content(blue_rocks.date_added)
      expect(page).to have_content("Capacity: #{red_rocks.capacity}")
      expect(page).to have_content("Capacity: #{blue_rocks.capacity}")
      expect(page).to have_link("New Venue")
    end
    it 'Has a form field that allows search results filtered by capacity'
      red_rocks = Venue.create!(name: "red rocks", capacity: 11000, outdoor: true)
      blue_rocks = Venue.create!(name: "blue rocks", capacity: 1100, outdoor: false)

      visit '/venues'

      fill_in 'Return results with capacity greater than: ', with: 1101
      
      click_on 'Go'

      expect(page).to have_content("Blue Rocks")
      expect(page).to_nothave_content("Red Rocks")
    end
  end
end