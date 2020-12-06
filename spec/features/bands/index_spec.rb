require 'rails_helper'


describe 'As a visitor' do
  describe 'When i visit /bands' do
    it 'I see the name of each band in the system' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true)
      mac_demarco =  Band.create(name: "Mac Demarco", booked: true)

      visit '/bands'
      expect(page).to have_content(lewis_del_mar.name)
      expect(page).to have_content(mac_demarco.name)
      expect(page).to have_content(lewis_del_mar.date_added)
    end
  end
end