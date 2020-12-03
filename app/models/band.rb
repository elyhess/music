class Band < ApplicationRecord
  validates_presence_of :name
  has_many :members, dependent: :destroy
end