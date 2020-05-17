class Action < ApplicationRecord
  belongs_to :counter
  belongs_to :user, optional: true
  belongs_to :routine, optional: true

end
