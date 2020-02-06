require 'rails_helper'

RSpec.describe LoveNote, type: :model do
  context "accessors from migrations" do
    let(:love_note) { build(:love_note) }

    it "has a readable and writable message" do
      expect(love_note.message).to eq("a test love note?!?")
      love_note.message = "CALL ME"
      expect(love_note.message).to eq("CALL ME")
    end
  end

  context "validations" do
    it { should validate_presence_of(:message) }
    it { should validate_uniqueness_of(:message) }
  end

  context "associations" do
    it { should have_many(:malontines) }
    it { should have_many(:users) }
    it { should have_many(:malones) }
  end

end
