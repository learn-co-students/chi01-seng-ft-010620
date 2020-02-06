require 'rails_helper'

RSpec.describe Malontine, type: :model do
  context 'accessors from migrations' do
    let(:malontine) { Malontine.new(creator_id: 4, malone_id: 5, love_note_id: 6) }

    it 'has a readable and writable creator_id' do
      expect(malontine.creator_id).to be 4
      malontine.creator_id = 7
      expect(malontine.creator_id).to be 7
    end

    it 'has a readable and writable malone_id' do
      expect(malontine.malone_id).to be 5
      malontine.malone_id = 8
      expect(malontine.malone_id).to be 8
    end

    it 'has a readable and writable love_note_id' do
      expect(malontine.love_note_id).to be 6
      malontine.love_note_id = 9
      expect(malontine.love_note_id).to be 9
    end
  end

  context 'validations' do
    subject { create(:malontine) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:creator_id) }
    it { should validate_presence_of(:love_note_id) }
    it { should validate_presence_of(:malone_id) }
  end

  context 'associations' do
    it { should belong_to(:creator).class_name(:User)}
    it { should belong_to(:malone) }
    it { should belong_to(:love_note) }
  end
end
