class Action < ApplicationRecord
  belongs_to :counter
  belongs_to :user, optional: true
  belongs_to :routine, optional: true

  scope :today, -> {Action.where('created_at >= ?', 24.hours.ago)}
  scope :week, -> {Action.where('created_at >= ?', 1.week.ago)}
  scope :month, -> {Action.where('created_at >= ?', 1.month.ago)}


  # /models/action.rb
  scope :total_reps, -> {sum(:reps)}
  scope :recent, -> {Action.order('created_at DESC limit 10')}

  def self.since(datetime)
    Action.where('created_at >= ? ', datetime)
  end

  def since(datetime)
    Action.where('user_id = ? AND created_at >= ? ', self.user.id, datetime)
  end

  # def self.total_reps(actions)
  #   actions.sum(:reps)
  # end

end
