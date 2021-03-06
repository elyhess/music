class Venue < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :capacity
  validates_inclusion_of :outdoor, in: [true, false]
  has_many :events, dependent: :destroy

  def self.order_by_most_recent
    order(outdoor: :DESC, created_at: :DESC)
  end

  def self.min_capacity(amount)
    where('capacity >= ?', amount)
  end

  def self.order_by_events
    # SELECT venues.*, COUNT(*) AS count FROM venues INNER JOIN events ON events.venue_id = venues.id GROUP BY venues.id ORDER BY count
    select('venues.*, COUNT(*) AS count').joins(:events).group(:id).order(count: :desc)
  end
  
end