require 'rails_helper'

RSpec.describe User, type: :model do

  @joseph = User.new(
        fname: "Joseph",
        lname: "Joestar",
        email: "jojo1@test.com"
      )

  @jonathan = User.new(
        fname: "Jonathan",
        lname: "Joestar",
        email: "jojo2@test.com"
      )

  context 'validation tests' do

      it 'has a first name, last name, and email' do
        expect(@joseph.fname).to eq('Joseph')
        expect(@joseph.lname).to eq('Joestar')
        expect(@joseph.fname).to eq('jojo1@test.com')
      end

      it 'saves to database with a password' do
        @joseph.password_digest = BCrypt::Password.create('testpassword', cost: 5)
        expect(@joseph.save).to eq(true)
      end

  end


end
