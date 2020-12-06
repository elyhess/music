class Member < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :instrument
  belongs_to :band

  def self.member_count
    count
  end

end