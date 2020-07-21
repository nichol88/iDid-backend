class Counter < ApplicationRecord
  has_many :actions

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :kind, in: ['default', 'weighted', 'timed']

  # return User and total reps of leader
  def leader(datetime)
    # get actions for this counter
    actions = self.actions.where('created_at >= ? ', datetime)

    # get unique users having actions for this counter
    unique_users = actions.pluck(:user_id).uniq

    # get sum of reps for each user within action set
    # result will be an array of hashes, e.g. [{user_id, reps}...]
    result = []
    unique_users.each do |id|
      reps = actions.where('user_id = ?', id).sum(:reps)
      result.push({user_id: id, reps: reps})
    end

    # return the hash with most reps
    result.max_by { |obj| obj[:reps] }

    # returns {user_id, reps}
  end


end
