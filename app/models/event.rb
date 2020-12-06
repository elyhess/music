class Event < ApplicationRecord
  validates_presence_of :name
  belongs_to :venue

  def self.event_count
    count
  end

  def self.sort_alphabetically
    order(:name)
  end
end