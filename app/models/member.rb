class Member < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :instrument
  belongs_to :band

  def self.member_count
    count
  end

  def self.order_by_alphabetical
    order(:name)
  end
end