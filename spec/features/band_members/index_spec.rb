require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit band/band_id/members/:' do
    it 'Then I see the members that is associated with the band and attributes' do

      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)
      member_1 = lewis_del_mar.members.create(name: "person1", instrument:"vocals")
      member_2 = lewis_del_mar.members.create(name: "person2", instrument:"computer")

      visit "/bands/#{lewis_del_mar.id}/members"

      expect(page).to have_content(member_1.name)
      expect(page).to have_content(member_2.name)
      expect(page).to have_content(member_1.instrument)
      expect(page).to have_content(member_2.instrument)
  end
end
end