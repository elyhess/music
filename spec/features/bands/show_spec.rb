require 'rails_helper'


describe 'As a visitor' do
  describe 'When i visit /bands/:id' do
    it 'I see the band with that id including the bands attributes:' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)
      mac_demarco =  Band.create(name: "Mac Demarco", booked: true)

      visit "/bands/#{mac_demarco.id}"

      expect(page).to have_content(mac_demarco.name)
      expect(page).to have_content(mac_demarco.booked)
    end
  end
end