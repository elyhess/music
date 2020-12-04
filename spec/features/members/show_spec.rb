require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit the events show page' do
    it 'I can see all of the events and the events attributes' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)

      member_1 = lewis_del_mar.members.create(name: "person1", instrument:"vocals")

      visit "/members/#{member_1.id}"

      expect(page).to have_content(member_1.name)
    end
  end
end