require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit bands/band_id/members/new:' do
    it 'Then I am able to add a new member to the band' do

      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)
      member_1 = lewis_del_mar.members.create(name: "person1", instrument:"vocals")
      member_2 = lewis_del_mar.members.create(name: "person2", instrument:"computer")
      

      visit "/bands/#{lewis_del_mar.id}/members"
      click_link "Add Member"
      expect(current_path).to eq("/bands/#{lewis_del_mar.id}/members/new")
      fill_in 'Name', with: "Tyler Childers"
      fill_in 'Instrument', with: 'Guitar'
      click_on 'Submit'
      

      expect(current_path).to eq("/bands/#{lewis_del_mar.id}/members")
      expect(page).to have_content("Tyler Childers")
    end
  end
end