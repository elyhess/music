require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit the events show page' do
    it 'I can see all of the events and the events attributes' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)

      member_1 = lewis_del_mar.members.create(name: "person1", instrument:"vocals")

      visit "/members/#{member_1.id}"

      expect(page).to have_content(member_1.name)
    end

    it 'allows me to delete a member' do
       lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)

      maximus = lewis_del_mar.members.create(name: "Max", instrument:"vocals")
      daniel = lewis_del_mar.members.create(name: "Daniel", instrument:"computer")

      visit "/members/#{maximus.id}"

      click_link 'Delete Member'

      expect(current_path).to eq('/members')

      expect(page).to_not have_content(maximus.name)
      expect(page).to have_content(daniel.name)
    end
  end
end