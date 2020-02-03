class DessertsController < ApplicationController
  def index
    @desserts = Dessert.all
  end

  def show
    @dessert = Dessert.find(params[:id])
    render :show
  end
end
