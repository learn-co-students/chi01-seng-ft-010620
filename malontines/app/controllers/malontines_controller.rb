class MalontinesController < ApplicationController
  before_action :find_malontine, only: [:show, :destroy, :edit]

  def index
    @malontines = Malontine.order('created_at DESC').page(params[:page])
  end

  def new
    @malones = Malone.all
    @malontine = Malontine.new
  end

  def create
    malontine = Malontine.new(malontine_params.merge({creator: User.first}))
    malontine.save
    redirect_to malontines_path
  end

  def show

  end

  def edit
    @malones = Malone.all
  end

  def destroy
    @malontine.destroy
    redirect_to root_path
  end

  private

  def find_malontine
    @malontine = Malontine.find(params[:id])
  end

  def malontine_params
    # Strong params for Malontine
    params.require(:malontine).permit(:love_note_message, :malone_id, :title)
  end
end
