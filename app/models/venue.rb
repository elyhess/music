class Venue < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :capacity
  has_many :events, dependent: :destroy

  def self.order_by_most_recent
    order(outdoor: :DESC, created_at: :DESC)
  end

  def self.min_capacity(amount)
    where('capacity > ?', amount)
  end

  def date_added
    created_at.strftime("%m/%d/%Y %H:%M")
  end
  
end