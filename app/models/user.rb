class User < ApplicationRecord
  # include ActiveModel::Serialization

  has_secure_password
  has_many :actions

  validates :email, uniqueness: true, presence: true
  validates :fname, presence: true
  validates :lname, presence: true

  def self.leaders_since(datetime)
    # get unique counters for this time frame
    actions = Action.since(datetime)
    unique_counters = actions.pluck(:counter).uniq

    # map unique counters to leader hash
    unique_counters.map do |counter|
      {counter: counter, leader: counter.leader(datetime)}
    end

    # returns array of hashes
  end

  def counter_actions(counter_id)
    self.actions.where("counter_id = ?", counter_id)
  end

  def name
    "#{fname} #{lname}"
  end

end
