class Routine < ApplicationRecord
  belongs_to :user
  has_many :actions
  has_many :counters, through: :actions

  validates :name, presence: true
  validates_inclusion_of :kind, in: ['workout', 'meditation', 'yoga']

end
