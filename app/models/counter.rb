class Counter < ApplicationRecord
  # include ActiveModel::Serialization

  has_many :actions

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :kind, in: ['default', 'weighted', 'timed']

  # /models/counter.rb

  # returns hash with leader (user) and total reps
  def leader(datetime = DateTime.parse('1/1/2020'))
    # get unique users having actions for this counter
    unique_users = self.actions.since(datetime).pluck(:user_id).uniq

    # get total_reps in this time frame for each unique user
    # result will be an array of hashes, e.g. [{user, reps}...]
    result = unique_users.map do |user_id|
      user = User.find(user_id)
      reps = user.actions.since(datetime).total_reps
      {user: {id: user.id, name: user.name}, reps: reps}
    end

    # return the hash with most reps
    result = result.max_by { |user_hash_map| user_hash_map[:reps] }

    # to properly serialize the data, we need to handle for nil
    result ? result : {error: "No data for selected time range"}

    # returns e.g. {:user=>{:id=>1, :name=>"Scooby Doo"}, :reps=>30}
  end


end
