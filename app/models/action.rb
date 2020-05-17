class Action < ApplicationRecord
  belongs_to :counter
  belongs_to :user, optional: true
  belongs_to :routine, optional: true

  def initialize
    self.name = Counter.find(self.counter_id).name
  end

end
