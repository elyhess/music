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
  end
end