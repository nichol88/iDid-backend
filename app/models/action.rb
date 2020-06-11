class Action < ApplicationRecord
  belongs_to :counter
  belongs_to :user, optional: true
  belongs_to :routine, optional: true

  scope :today, -> {Action.where('created_at >= ?', 24.hours.ago)}
  scope :week, -> {Action.where('created_at >= ?', 1.week.ago)}
  scope :month, -> {Action.where('created_at >= ?', 1.month.ago)}

  scope :recent, -> {Action.order('created_at DESC limit 10')}

  


end
