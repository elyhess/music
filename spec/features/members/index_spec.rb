require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit /members' do
    it 'Then I see each event in the system including the events attributes' do
      lewis_delmar = Band.create(name: "Lewis Del Mar", booked: true)

      member_1 = lewis_delmar.members.create(name: "person1", instrument:"vocals")
      member_2 = lewis_delmar.members.create(name: "person2", instrument:"computer")

      visit '/members'
      
      expect(page).to have_content(member_1.name)
      expect(page).to have_content(member_2.name)
      expect(page).to have_content(member_2.instrument)
      expect(page).to have_content(member_1.instrument)
    end

    it 'can sort members by alphabetical order' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)

      maximus = lewis_del_mar.members.create(name: "Max", instrument:"vocals")
      daniel = lewis_del_mar.members.create(name: "Daniel", instrument:"computer")
      visit "/bands/#{lewis_del_mar.id}/members"
      click_on "Alphabetize"

      expect(current_path).to eq("/bands/#{lewis_del_mar.id}/members/")
      expect(daniel.name).to appear_before(maximus.name)
      
    end

    it 'I see an update member button, when clicked it takes me to the member edit page' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')
      daniel = lewis_del_mar.members.create(name: "Daniel", instrument:"computer")
      
      visit '/members'
    
      expect(page).to have_link("Update Member")

      click_on "Update Member"

      expect(current_path).to eq("/members/#{daniel.id}/edit")
    end

    it 'I see an delete member button, when clicked it removes the member from the page' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')
      daniel = lewis_del_mar.members.create(name: "Daniel", instrument:"computer")
      
      visit '/members'
    
      expect(page).to have_link("Delete Member")

      click_on "Delete Member"

      expect(current_path).to eq("/members")
    end
  end
end