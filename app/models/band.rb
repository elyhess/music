class Band < ApplicationRecord
  validates_presence_of :name
  has_many :members, dependent: :destroy

  def date_added
    created_at.strftime("%m/%d/%Y %H:%M")
  end



end