class Band < ApplicationRecord
  validates_presence_of :name
  has_many :members, dependent: :destroy

  def self.order_by_most_recent
    order(booked: :DESC, created_at: :DESC)
  end

  def self.order_by_members
    select('bands.*, COUNT(*) AS count').joins(:members).group(:id).order(count: :desc)
  end
end