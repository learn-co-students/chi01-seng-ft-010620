require_relative '../app/hero'

describe "Hero instance methods" do
  # thor = Hero.new...
  let(:thor) {
     Hero.new("Thor", [
                {
                    name: 'Super Strength',
                    coolness: 3
                },
                {
                    name:'Flight',
                    coolness: 5
                },
                {
                    name: 'Lighting Blast',
                    coolness: 10
                }
            ])
  }

  it "has a readable name" do
    puts "in first hero test"
    expect(thor.name).to eq("Thor")
    new_name = "Worse Loki"
    thor.name = new_name
    expect(thor.name).to eq("Worse Loki")
  end

  it "returns an array of abilities when asked" do
    expect(thor.abilities).to be_an Array
    expect(thor.abilities.all? { |a| a.class == Hash }).to eq(true)
  end

  it "allows an ability to be added with a name and coolness score" do
    expect{thor.add_ability("Jogging", 7)}.to change(thor.abilities, :length).by(1)
    expect(thor.abilities[-1][:name]).to eq("Jogging")
  end

  it "will not allow a blank ability to be added" do
    expect{ thor.add_ability(nil, nil) }.to raise_error
  end
end
