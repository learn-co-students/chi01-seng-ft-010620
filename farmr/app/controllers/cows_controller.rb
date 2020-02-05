class CowsController < ApplicationController

  def index
    @cows = Cow.all
  end

  def new
    p "NEW PATH"
    @cow = Cow.new
    @cow.name = flash[:cow_name]
    @cow.spots = flash[:cow_spots]
    @farmers = Farmer.all
  end

  def create
    @cow = Cow.new(cow_params)
    if @cow.save
      redirect_to cows_path
    else
      flash[:errors] = @cow.errors.full_messages
      flash[:cow_name] = @cow.name
      flash[:cow_spots] = @cow.spots
      redirect_to new_cow_path
    end
  end

  def show
    @cow = Cow.find(params[:id])
  end

  private

  def cow_params
    params.require(:cow).permit(:name, :spots, :farmer_id)
  end
end
