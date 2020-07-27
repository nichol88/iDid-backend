require 'rails_helper'

# SCHEMA:
# t.integer "counter_id"
# t.integer "user_id"
# t.integer "reps"
# t.float "weight"
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false

RSpec.describe Action, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  @weighted_action = Action.new(
    counter_id: 1,
    user_id: 1,
    weight: 65.0
  )

  context 'validations' do
    it 'has valid attributes' do
      expect @weighted_action.weight.to eq(65.0)
    end
  end
end
