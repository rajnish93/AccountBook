class ChartaccountsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_chartaccount, only: [:show, :edit, :update, :destroy]

  # GET /chartaccounts
  # GET /chartaccounts.json
  def index
    @chartaccounts = Chartaccount.all
    @chartaccounts = Chartaccount.includes(:accountgroup)
    authorize @chartaccounts
  end

  # GET /chartaccounts/1
  # GET /chartaccounts/1.json
  def show
  end

  # GET /chartaccounts/new
  def new
    @chartaccount = Chartaccount.new
    authorize @chartaccount
  end

  # GET /chartaccounts/1/edit
  def edit
  end

  # POST /chartaccounts
  # POST /chartaccounts.json
  def create
    @chartaccount = Chartaccount.new(chartaccount_params)
    authorize @chartaccount
    respond_to do |format|
      if @chartaccount.save
        format.html { redirect_to chartaccounts_path, notice: 'Chartaccount was successfully created.' }
        format.json { render :show, status: :created, location: @chartaccount }
      else
        format.html { render :new }
        format.json { render json: @chartaccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chartaccounts/1
  # PATCH/PUT /chartaccounts/1.json
  def update
    respond_to do |format|
      if @chartaccount.update(chartaccount_params)
        authorize @chartaccount
        format.html { redirect_to chartaccounts_path, notice: 'Chartaccount was successfully updated.' }
        format.json { render :show, status: :ok, location: @chartaccount }
      else
        format.html { render :edit }
        format.json { render json: @chartaccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chartaccounts/1
  # DELETE /chartaccounts/1.json
  def destroy
    @chartaccount.destroy
    authorize @chartaccount
    respond_to do |format|
      format.html { redirect_to chartaccounts_url, notice: 'Chartaccount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chartaccount
      @chartaccount = Chartaccount.find(params[:id])
      authorize @chartaccount
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chartaccount_params
      params.require(:chartaccount).permit(:rkcoacode, :rkcoaname, :accountgroup_id)
    end
end
