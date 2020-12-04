require 'rails_helper'

describe 'As a visitor' do
  describe 'when i am on an members show page' do
    it 'I can update its information' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)

      maximus = lewis_del_mar.members.create(name: "Max", instrument:"vocals")
      daniel = lewis_del_mar.members.create(name: "Daniel", instrument:"computer")
      
      visit "/members/#{maximus.id}"

      click_link 'Edit'

      expect(current_path).to eq("/members/#{maximus.id}/edit")
      
      fill_in 'instrument', with: 'guitar'
      click_on 'Update Member'

      expect(current_path).to eq("/members/#{maximus.id}")
      expect(page).to have_content("guitar")
    end
  end
end