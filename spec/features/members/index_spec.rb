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
  end
end