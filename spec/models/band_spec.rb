require 'rails_helper'

RSpec.describe Band do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :members}
  end

  describe 'instance methods' do
    it '#date_format' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')

      expect(lewis_del_mar.date_added).to eq("12/03/2020 19:24")
    end
  end
  describe 'class methods' do
    it '.order_by_most_recent' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')
      lewis_del_venus = Band.create(name: "Lewis Del Venus", booked: true, created_at: 'Thu, 06 Dec 2020 19:24:11 UTC +00:00')
      lewis_del_earth = Band.create(name: "Lewis Del Earth", booked: true, created_at: 'Thu, 05 Dec 2020 19:24:11 UTC +00:00')
      lewis_del_saturn = Band.create(name: "Lewis Del Saturn", booked: false, created_at: 'Thu, 01 Dec 2020 19:24:11 UTC +00:00')

      expect(Band.order_by_most_recent).to eq([lewis_del_saturn,lewis_del_mar,lewis_del_earth,lewis_del_venus].reverse)
    end

    it '.order_by_members' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')
      maximus = lewis_del_mar.members.create!(name: "Max", instrument:"vocals")
      daniel = lewis_del_mar.members.create!(name: "Daniel", instrument:"computer")

      cats_in_bandanas = Band.create(name: "Cats in Bandans", booked: true, created_at: 'Thu, 05 Dec 2020 19:24:11 UTC +00:00')
      kitteh = cats_in_bandanas.members.create!(name: "Kitteh in the Hat", instrument:"Meows")
      
      expect(Band.order_by_members).to eq([lewis_del_mar, cats_in_bandanas])
    end
  end
end