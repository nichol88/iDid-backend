class Counter < ApplicationRecord
  has_many :actions

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :kind, in: ['default', 'weighted', 'timed']
end
