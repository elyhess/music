require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit band/band_id/members/:' do
    it 'Then I see the members that is associated with the band and attributes' do

      lewis_del_mar = Band.create!(name: "Lewis Del Mar", booked: true)
      maximus = lewis_del_mar.members.create!(name: "Max", instrument:"vocals")
      daniel = lewis_del_mar.members.create!(name: "Daniel", instrument:"computer")

      visit "/bands/#{lewis_del_mar.id}/members"

      expect(page).to have_content(maximus.name)
      expect(page).to have_content(daniel.name)
      expect(page).to have_content(maximus.instrument)
      expect(page).to have_content(daniel.instrument)
      expect(page).to have_content("Member Count #{lewis_del_mar.members.member_count}")
      
    end

    it 'has working nav bar links' do
      visit bands_path

      expect(page).to have_link("Bands")
      click_link "Bands"
      expect(current_path).to eq(bands_path)

      expect(page).to have_link("Members")
      click_link "Members"
      expect(current_path).to eq(members_path)

      expect(page).to have_link("Venues")
      click_link "Venues"
      expect(current_path).to eq(venues_path)

      expect(page).to have_link("Events")
      click_link "Events"
      expect(current_path).to eq(events_path)
    end
  end
end