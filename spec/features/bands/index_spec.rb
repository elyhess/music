require 'rails_helper'


describe 'As a visitor' do
  describe 'When i visit /bands' do
    it 'I see the name of each band in the system' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: false, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')
      mac_demarco =  Band.create(name: "Mac Demarco", booked: true, created_at: 'Thu, 04 Dec 2020 19:24:11 UTC +00:00')

      visit '/bands'
      expect(page).to have_content(lewis_del_mar.name)
      expect(page).to have_content(mac_demarco.name)
      expect(page).to have_content(lewis_del_mar.date_added)
      expect(mac_demarco.name).to appear_before(lewis_del_mar.name)
    end

    it "I see a link to sort by member count, when clicked orders bands" do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')
      maximus = lewis_del_mar.members.create!(name: "Max", instrument:"vocals")
      daniel = lewis_del_mar.members.create!(name: "Daniel", instrument:"computer")

      cats_in_bandanas = Band.create(name: "Cats in Bandans", booked: true, created_at: 'Thu, 05 Dec 2020 19:24:11 UTC +00:00')
      kitteh = cats_in_bandanas.members.create!(name: "Kitteh in the Hat", instrument:"Meows")

      visit '/bands'

      expect(page).to have_link("Sort by band size")

      click_on "Sort by band size"

      expect(current_path).to eq('/bands')
      expect(page).to have_content("#{lewis_del_mar.name} - Members: 2")
      expect(page).to have_content("#{cats_in_bandanas.name} - Members: 1")
      expect(lewis_del_mar.name).to appear_before(cats_in_bandanas.name)
    end
  end
end