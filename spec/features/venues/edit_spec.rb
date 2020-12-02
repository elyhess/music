require 'rails_helper'

describe 'As a visitor' do
  describe 'when i am on the venues show page' do
    it 'I can update its information' do
      red_rocks = Venue.create(name: "red rocks", capacity: 11000, outdoor: true)

      visit "/venues/#{red_rocks.id}"

      click_link "Update Venue"
      expect(current_path).to eq("/venues/#{red_rocks.id}/edit")

      fill_in 'Name', with: 'blue rocks'
      fill_in 'Capacity', with: 8390

      click_on 'Submit'
      expect(current_path).to eq("/venues/#{red_rocks.id}")
      expect(page).to have_content("blue rocks")
    end
  end
end