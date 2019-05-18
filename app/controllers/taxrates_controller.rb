class TaxratesController < ApplicationController
  before_action :set_taxrate, only: [:show, :edit, :update, :destroy]

  # GET /taxrates
  # GET /taxrates.json
  def index
    @taxrates = Taxrate.all
  end

  # GET /taxrates/1
  # GET /taxrates/1.json
  def show
  end

  # GET /taxrates/new
  def new
    @taxrate = Taxrate.new
  end

  # GET /taxrates/1/edit
  def edit
  end

  # POST /taxrates
  # POST /taxrates.json
  def create
    @taxrate = Taxrate.new(taxrate_params)

    respond_to do |format|
      if @taxrate.save
        format.html { redirect_to @taxrate, notice: 'Taxrate was successfully created.' }
        format.json { render :show, status: :created, location: @taxrate }
      else
        format.html { render :new }
        format.json { render json: @taxrate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxrates/1
  # PATCH/PUT /taxrates/1.json
  def update
    respond_to do |format|
      if @taxrate.update(taxrate_params)
        format.html { redirect_to @taxrate, notice: 'Taxrate was successfully updated.' }
        format.json { render :show, status: :ok, location: @taxrate }
      else
        format.html { render :edit }
        format.json { render json: @taxrate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxrates/1
  # DELETE /taxrates/1.json
  def destroy
    @taxrate.destroy
    respond_to do |format|
      format.html { redirect_to taxrates_url, notice: 'Taxrate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taxrate
      @taxrate = Taxrate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taxrate_params
      params.require(:taxrate).permit(:chartaccount_id, :rktaxtype, :rktaxname, :rktaxpercent)
    end
end
