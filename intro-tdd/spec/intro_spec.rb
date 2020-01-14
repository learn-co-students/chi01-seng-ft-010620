describe "testing" do
  describe "rspec syntax" do
    it "involves nested blocks of context containing grouped assertions" do
      expect(1 + 1).to eq(2.0)
    end

    it "has shorthand for setting tests to pending status" do
      expect(1 + 2).to eq(3)
    end

    it "can be persnickety" do
      expect(2 + 2).to eq(4)
    end

    it "has multiple ways for checking sameness, called 'matchers'" do
      expect(2).to eq(2)
      expect(2).to be(2)
      expect(2).to be > 0
      expect(2).to be_an Integer
      expect(2).to be_between(1,3)
      expect(2).to be_truthy
      expect(2).to_not be_nil
    end
  end
end
