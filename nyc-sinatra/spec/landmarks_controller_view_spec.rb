require 'spec_helper'

describe LandmarksController do
  before do
    queenb = Figure.create(:name => "Beyonce")
    bqe = Landmark.create(name: 'BQE', year_completed: 1961)
    bqe.figure = queenb
    bqe.save
  end

  after do
    Landmark.destroy_all
    Figure.destroy_all
  end

  it "allows you to view form to create a new landmark" do
    visit '/landmarks/new'
    expect(page.body).to include('<form')
    expect(page.body).to include('landmark[name]')
    expect(page.body).to include('landmark[year_completed]')
  end

  it "allows you to create a new landmark" do
    visit '/landmarks/new'
    fill_in :landmark_name, :with => "Arc de Triomphe"
    fill_in :landmark_year_completed, :with => 1806
    click_button "Create New Landmark"
    expect(Landmark.all.count).to eq(2)
  end

  it "allows you to list all landmarks" do
    visit '/landmarks'

    expect(page.status_code).to eq(200)

    expect(page.body).to include("BQE")
    expect(page.body).to include('1961')
  end

  it "allows you to see a single landmark" do
    @landmark = Landmark.first
    get "/landmarks/#{@landmark.id}"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("BQE")
    expect(last_response.body).to include("1961")
  end

  it "allows you to view the form to edit a single landmark" do
    @landmark = Landmark.first
    get "/landmarks/#{@landmark.id}/edit"

    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('<form')
    expect(last_response.body).to include('landmark[name]')
    expect(last_response.body).to include('landmark[year_completed]')
    expect(last_response.body).to include(@landmark.name)
    expect(last_response.body).to include(@landmark.year_completed.to_s)

  end


  it "allows you to edit a single landmark" do
    @original_landmark = Landmark.first

    visit "/landmarks/#{@original_landmark.id}/edit"
    fill_in :name, with: "BQE!!!!"
    fill_in :year_completed, with: 9999
    click_button "Edit Landmark"

    expect(page.body).to include("BQE!!!!")
    expect(page.body).to include("9999")

    @updated_landmark = Landmark.first
    expect(page.current_path).to eq("/landmarks/#{@original_landmark.id}")
    expect(@updated_landmark.name).to eq("BQE!!!!")
    expect(@updated_landmark.year_completed.to_s).to eq("9999")
  end
end
