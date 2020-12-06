require 'rails_helper'

RSpec.describe Event do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should belong_to :venue}
  end
  
  describe 'class methods' do
    it '.event_count' do
      red_rocks = Venue.create!(name: "red rocks", capacity: 11000, outdoor: true)
      red_rocks.events.create!(name: "event1")
      red_rocks.events.create!(name: "event2")
      red_rocks.events.create!(name: "event3")

      expect(Event.event_count).to eq(3)
    end

    it '.sort_alphabetically' do
      red_rocks = Venue.create!(name: "red rocks", capacity: 11000, outdoor: true)
      event_1 = red_rocks.events.create!(name: "X")
      event_2 = red_rocks.events.create!(name: "D")
      event_3 = red_rocks.events.create!(name: "A")

      expect(Event.sort_alphabetically).to eq([event_3, event_2, event_1])
    end
  end

  describe 'instance methods' do
  end
end