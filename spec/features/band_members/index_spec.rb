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

    it 'I see each member as a link, when clicked it takes me to members show page' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')
      daniel = lewis_del_mar.members.create(name: "Daniel", instrument:"Guitar")
      
      visit "/bands/#{lewis_del_mar.id}/members"
    
      expect(page).to have_link("Daniel")

      click_on "Daniel"

      expect(current_path).to eq("/members/#{daniel.id}")
    end
  end
end