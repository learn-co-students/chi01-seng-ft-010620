class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def new
    @cohort = Cohort.new
  end

  def create
    p params[:cohort]
    p cohort_params
    @cohort = Cohort.new(cohort_params)
    @cohort.save
    redirect_to '/cohorts'
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])

    if @cohort.update(cohort_params)
      redirect_to "/cohorts/#{@cohort.id}"
    else
      render :edit
    end
  end

  def destroy
    Cohort.destroy(params[:id])
    redirect_to cohorts_path
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name)
  end

end
