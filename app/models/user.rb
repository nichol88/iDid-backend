class User < ApplicationRecord
  # include ActiveModel::Serialization

  has_secure_password
  has_many :actions

  validates :email, uniqueness: true, presence: true
  validates :fname, presence: true
  validates :lname, presence: true

  # returns each counter's rep leader, all-time
  # def self.top_all_time
  #   records = ActiveRecord::Base.connection.execute('SELECT SUM(reps), counter_id, user_id
  #     FROM actions
  #     INNER JOIN counters ON counters.id = counter_id
  #     INNER JOIN users ON users.id = user_id
  #     GROUP BY user_id, counter_id;')
  #
  #   records.to_a.map { |record|
  #     record[:allTimeLeader] = User.find_by(id: record['user_id']).fname
  #     record[:counter] = Counter.find_by(id: record['counter_id']).name
  #     record
  #   }
  # end

  def self.leaders_since(datetime)
    # get unique counters for this time frame
    actions = Action.since(datetime)
    unique_counters = actions.pluck(:counter)

    # map unique counters to leader hash
    unique_counters.map do |counter|
      {counter: counter, leader: counter.leader(datetime)}
    end

    # returns array of hashes

  end

  # /models/user.rb

  def counter_actions(counter_id)
    self.actions.where("counter_id = ?", counter_id)
  end

  def name
    "#{fname} #{lname}"
  end




end
