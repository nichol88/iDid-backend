class User < ApplicationRecord
  has_secure_password
  has_many :actions

  validates :email, uniqueness: true, presence: true
  validates :fname, presence: true
  validates :lname, presence: true

  # returns each counter's rep leader, all-time
  def self.top_all_time
    records = ActiveRecord::Base.connection.execute('SELECT SUM(reps), counter_id, user_id
      FROM actions
      INNER JOIN counters ON counters.id = counter_id
      INNER JOIN users ON users.id = user_id
      GROUP BY user_id, counter_id;')

    records.to_a.map { |record|
      record[:allTimeLeader] = User.find_by(id: record['user_id']).fname
      record[:counter] = Counter.find_by(id: record['counter_id']).name
      record
    }
  end

end
