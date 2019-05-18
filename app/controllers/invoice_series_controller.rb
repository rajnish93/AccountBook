class InvoiceSeriesController < ApplicationController
  before_action :set_invoice_series, only: [:show, :edit, :update, :destroy]

  # GET /invoice_series
  # GET /invoice_series.json
  def index
    byebug
    @invoice_series = InvoiceSeries.all
  end

  # GET /invoice_series/1
  # GET /invoice_series/1.json
  def show
    byebug
  end

  # GET /invoice_series/new
  def new
    byebug
    @invoice_series = InvoiceSeries.new
  end

  # GET /invoice_series/1/edit
  def edit
    byebug
  end

  # POST /invoice_series
  # POST /invoice_series.json
  def create
    byebug
    @invoice_series = InvoiceSeries.new(invoice_series_params)

    respond_to do |format|
      if @invoice_series.save
        format.html { redirect_to @invoice_series, notice: 'Invoice series was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_series }
      else
        format.html { render :new }
        format.json { render json: @invoice_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_series/1
  # PATCH/PUT /invoice_series/1.json
  def update
    byebug
    respond_to do |format|
      if @invoice_series.update(invoice_series_params)
        format.html { redirect_to @invoice_series, notice: 'Invoice series was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_series }
      else
        format.html { render :edit }
        format.json { render json: @invoice_series.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_default
    byebug
    InvoiceSeries.where(id: params["default_series"]).update_all(rkseriesdefault: true)
    InvoiceSeries.where.not(id: params["default_series"]).update_all(rkseriesdefault: false)

    redirect_to(:action => 'index')
  end
  # DELETE /invoice_series/1
  # DELETE /invoice_series/1.json
  def destroy
    byebug
    @invoice_series.destroy
    respond_to do |format|
      format.html { redirect_to invoice_series_index_url, notice: 'Invoice series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_series
      byebug
      @invoice_series = InvoiceSeries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_series_params
      params.require(:invoice_series).permit(:rkseriesname, :rkseriesvalue, :rkseriesactive, :rkseriesdefault, :rkfirst_number)
    end
end
