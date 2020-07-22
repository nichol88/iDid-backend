class Counter < ApplicationRecord
  # include ActiveModel::Serialization

  has_many :actions

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :kind, in: ['default', 'weighted', 'timed']

  # /models/counter.rb

  # returns hash with leader (user) and total reps
  def leader(datetime = DateTime.parse('1/1/2020'))
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
    leader = result.max_by { |obj| obj[:reps] }

    # returns {user_id, name, reps, counter}
    if !leader.empty?
      leader[:counter_name] = self.name
      leader[:name] = User.find(leader[:user_id]).fname
    end
    leader
  end


end
