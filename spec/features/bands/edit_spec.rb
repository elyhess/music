require 'rails_helper'

describe 'As a visitor' do
  describe 'when i am on the bands show page' do
    it 'I can update its information' do
      lewis_delmar = Band.create(name: "Lewis Del Mar", booked: true)

      visit "/bands/#{lewis_delmar.id}"

      click_link "Update Band"
      expect(current_path).to eq("/bands/#{lewis_delmar.id}/edit")

      fill_in 'Name', with: 'Lewis Del Mar'
      check 'Booked'

      click_on 'Submit'
      expect(current_path).to eq("/bands/#{lewis_delmar.id}")
      expect(page).to have_content("Lewis Del Mar")
    end
  end
end