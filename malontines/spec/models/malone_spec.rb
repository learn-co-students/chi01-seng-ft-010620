require 'rails_helper'

RSpec.describe Malone, type: :model do
  context "accessors from migrations" do
    let(:malone) { build(:malone) }

    it "has a readable and writable name" do
      expect(malone.name).to eq("Image: a test malone!")
      malone.name = "Fun Malone"
      expect(malone.name).to eq("Fun Malone")
    end

    it "has a readable and writable image url" do
      expect(malone.image_url).to eq("malone.jpg")
      malone.image_url = "malone99.jpg"
      expect(malone.image_url).to eq("malone99.jpg")
    end
    it "has a readable and writable description" do
      expect(malone.description).to eq("pic of post malone")
      malone.description = "hi-res post photo"
      expect(malone.description).to eq("hi-res post photo")
    end
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:image_url) }
    it { should validate_uniqueness_of(:image_url) }
    it { should validate_presence_of(:description) }
  end

  context "associations" do
    it { should have_many(:malontines) }
    it { should have_many(:users) }
    it { should have_many(:love_notes) }
  end
end
