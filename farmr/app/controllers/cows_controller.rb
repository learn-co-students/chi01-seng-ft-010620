class CowsController < ApplicationController

  def index
    @cows = Cow.all
  end

  def new
    @cow = Cow.new
    @farmers = Farmer.all
  end

  def create
    cow = Cow.new(cow_params)
    cow.save
    redirect_to cows_path
  end

  private

  def cow_params
    params.require(:cow).permit(:name, :spots, :farmer_id)
  end
end
