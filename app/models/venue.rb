class Venue < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :capacity
  has_many :events
end