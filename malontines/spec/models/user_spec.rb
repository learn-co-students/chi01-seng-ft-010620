require 'rails_helper'

RSpec.describe User, type: :model do
  context 'accessors from migrations' do
    let(:test_password) { "yoloswag425" }
    let(:user) { User.new(username: "karen321", password: test_password, password_confirmation: test_password) }
    it 'has a username' do
      expect(user.username).to eq("karen321")
    end

    it 'has a user-provided password' do
      expect(user.password).to eq("yoloswag425")
    end

    it 'saves the password to the database as a BCrypt password digest' do
      user.save
      expect(user.password_digest[0..5]).to eq("$2a$04")
      expect(user.password_digest.length).to be(60)
    end

    it 'saves a digest that authenticates with the user-provided password' do
      user.save
      expect(user.authenticate(test_password)).to be_truthy
    end

    it 'will not authenticate an incorrect password attempt' do
      user.save
      expect(user.authenticate("wrong_guess")).to be_falsey
    end
  end

  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password_digest) }
  end

  context 'associations' do
    it { should have_many(:malontines) }
    it { should have_many(:malones) }
    it { should have_many(:love_notes) }
  end
end
