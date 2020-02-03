class TasteTestersController < ApplicationController
  before_action :set_taste_tester, only: [:show, :edit, :update, :destroy]

  # GET /taste_testers
  # GET /taste_testers.json
  def index
    @taste_testers = TasteTester.all
  end

  # GET /taste_testers/1
  # GET /taste_testers/1.json
  def show
  end

  # GET /taste_testers/new
  def new
    @taste_tester = TasteTester.new
  end

  # GET /taste_testers/1/edit
  def edit
  end

  # POST /taste_testers
  # POST /taste_testers.json
  def create
    @taste_tester = TasteTester.new(taste_tester_params)

    respond_to do |format|
      if @taste_tester.save
        format.html { redirect_to @taste_tester, notice: 'Taste tester was successfully created.' }
        format.json { render :show, status: :created, location: @taste_tester }
      else
        format.html { render :new }
        format.json { render json: @taste_tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taste_testers/1
  # PATCH/PUT /taste_testers/1.json
  def update
    respond_to do |format|
      if @taste_tester.update(taste_tester_params)
        format.html { redirect_to @taste_tester, notice: 'Taste tester was successfully updated.' }
        format.json { render :show, status: :ok, location: @taste_tester }
      else
        format.html { render :edit }
        format.json { render json: @taste_tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taste_testers/1
  # DELETE /taste_testers/1.json
  def destroy
    @taste_tester.destroy
    respond_to do |format|
      format.html { redirect_to taste_testers_url, notice: 'Taste tester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taste_tester
      @taste_tester = TasteTester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taste_tester_params
      params.require(:taste_tester).permit(:name, :age)
    end
end
