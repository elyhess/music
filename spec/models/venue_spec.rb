require 'rails_helper'

RSpec.describe Venue do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :capacity}
  end

  describe 'relationships' do
    it {should have_many(:events).dependent(:destroy)}
  end

  describe 'class methods' do
    it '.order_by_most_recent' do
      red_rocks = Venue.create!(name: "red rocks", capacity: 11000, outdoor: true, created_at: 'Thu, 01 Dec 2011 19:23:11 UTC +00:00')
      blue_rocks = Venue.create!(name: "blue rocks", capacity: 23312, outdoor: false, created_at: 'Thu, 01 Dec 2012 19:23:11 UTC +00:00')
      yellow_rocks= Venue.create!(name: "yellow rocks", capacity: 32312, outdoor: true, created_at: 'Thu, 01 Dec 2013 19:23:11 UTC +00:00')
      orange_rocks = Venue.create!(name: "orange rocks", capacity: 3122, outdoor: false, created_at: 'Thu, 01 Dec 2014 19:23:11 UTC +00:00')
      teal_rocks= Venue.create!(name: "teal rocks", capacity: 32312, outdoor: true, created_at: 'Thu, 01 Dec 2015 19:23:11 UTC +00:00')
      black_rocks = Venue.create!(name: "black rocks", capacity: 3122, outdoor: false, created_at: 'Thu, 01 Dec 2016 19:23:11 UTC +00:00')


      expect(Venue.order_by_most_recent).to eq([teal_rocks, yellow_rocks, red_rocks, black_rocks, orange_rocks, blue_rocks])
    end

    it '.min_capacity' do
      red_rocks = Venue.create!(name: "red rocks", capacity: 11000, outdoor: true, created_at: 'Thu, 01 Dec 2011 19:23:11 UTC +00:00')
      blue_rocks = Venue.create!(name: "blue rocks", capacity: 11, outdoor: false, created_at: 'Thu, 01 Dec 2012 19:23:11 UTC +00:00')
      yellow_rocks= Venue.create!(name: "yellow rocks", capacity: 1123, outdoor: true, created_at: 'Thu, 01 Dec 2013 19:23:11 UTC +00:00')
      orange_rocks = Venue.create!(name: "orange rocks", capacity: 2332, outdoor: false, created_at: 'Thu, 01 Dec 2014 19:23:11 UTC +00:00')
      teal_rocks= Venue.create!(name: "teal rocks", capacity: 3234, outdoor: true, created_at: 'Thu, 01 Dec 2015 19:23:11 UTC +00:00')
      black_rocks = Venue.create!(name: "black rocks", capacity: 1144, outdoor: false, created_at: 'Thu, 01 Dec 2016 19:23:11 UTC +00:00')

      expect(Venue.min_capacity(2000)).to eq([red_rocks, orange_rocks, teal_rocks])
    end
  end

  describe 'instance methods' do
    it '#date_format' do
      red_rocks = Venue.create!(name: "red rocks", capacity: 11000, outdoor: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00' )
      
      expect(red_rocks.date_added).to eq("12/03/2020 19:24")
    end
  end
end