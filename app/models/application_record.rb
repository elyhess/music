class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def date_added
    self.created_at.strftime("%m/%d/%Y %H:%M")
  end
end
