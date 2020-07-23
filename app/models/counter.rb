class Counter < ApplicationRecord
  # include ActiveModel::Serialization

  has_many :actions

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :kind, in: ['default', 'weighted', 'timed']

  # /models/counter.rb

  # returns user with most reps for this counter
  def leader(datetime)
    # puts "leader(datetime)"
    # filter actions in this time range
    actions_in_range = self.actions.since(datetime)
    # puts "actions in range: #{actions_in_range.length}"

    # get unique users having actions for this counter
    unique_users = actions_in_range.pluck(:user_id).uniq
    # puts "unique users: #{unique_users}"

    leader = ''
    # for each unique user having performed actions in this time range for this counter
    # puts "finding total reps for each user"
    # binding.pry
    result = unique_users.inject(0){ |memo, user_id|
      # puts "memo: #{memo}, user_id: #{user_id}"
      # get those actions
      acs = actions_in_range.where('user_id = ?', user_id)
      # puts "user's actions in this range: #{acs.length}"
      # sum the reps
      reps = acs.sum(:reps)
      # puts "total reps: #{reps}"

      if reps > memo
        # puts "new max reps, saving to memo"
        leader = User.find_by(id: user_id).name
        # puts "new leader: #{leader}"
        reps
      else
        memo
      end
    }
    # puts "leader for #{self.name}: #{leader}, reps: #{result}"
    {counter_name: self.name, name: leader, reps: result}
  end

  def self.leaders(datetime)
    Counter.all.map{ |counter|
      counter.leader(datetime)
    }
  end


end
