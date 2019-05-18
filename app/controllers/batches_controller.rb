class BatchesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  # GET /batches
  # GET /batches.json
  def index
    @batches = Batch.all
    @batches = Batch.includes(:product)
    authorize @batches
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new
    authorize @batch
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch = Batch.new(batch_params)
    authorize @batch

    respond_to do |format|
      if @batch.save
        format.html { redirect_to batches_path, notice: 'Batch was successfully created.' }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        authorize @batch
        format.html { redirect_to batches_path, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    authorize @batch
    respond_to do |format|
      format.html { redirect_to batches_url, notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
      authorize @batch
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:rkbatchstatus, :rkbatchno, :product_id, :rkbatchstock, :rkbatchpacking, :rkbatchpurchaserate, :rkbatchsalerate, :rkbatchwholesalerate, :rkbatchexpiry, :rkbatchmrp)
    end
end
