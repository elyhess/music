class Member < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :instrument
  belongs_to :band
end