class ProductpurchasevatsController < ApplicationController
  before_action :set_productpurchasevat, only: [:show, :edit, :update, :destroy]

  # GET /productpurchasevats
  # GET /productpurchasevats.json
  def index
    @productpurchasevats = Productpurchasevat.all
    @productpurchasevats = Productpurchasevat.includes(:chartaccount,:supplier,:employee)
    #@batches = Batch.select(:name).where("product_id = ?", Product.first.id)
  end

  # GET /productpurchasevats/1
  # GET /productpurchasevats/1.json
  def show
   # @batch = Batch.select(:rkbatchno).find_by("id = ?", params[:batch_id])
  end

  # GET /productpurchasevats/new
  def new
    @productpurchasevat = Productpurchasevat.new
    @products = Product.select(:id,:rkproductname)
    @batches = Batch.select(:rkbatchno).where("product_id = ?")
    @batches1 = Batch.select(:rkbatchpacking,:rkbatchexpiry,:rkbatchpurchaserate).where("batch_id = ?")
  end

  # GET /productpurchasevats/1/edit
  def edit
  end

  # POST /productpurchasevats
  # POST /productpurchasevats.json
  def create
    @productpurchasevat = Productpurchasevat.new(productpurchasevat_params)
    @products = Product.select(:id,:rkproductname)
    #@batches = Batch.select(:rkbatchno,:rkbatchpacking,:rkbatchexpiry,:rkbatchpurchaserate).where("product_id = ?", Product.first.id)
    respond_to do |format|
      if @productpurchasevat.save
        format.html { redirect_to @productpurchasevat, notice: 'Productpurchasevat was successfully created.' }
        format.json { render :show, status: :created, location: @productpurchasevat }
      else
        format.html { render :new }
        format.json { render json: @productpurchasevat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_batches
    render json: @batches = @batches = Batch.select(:rkbatchno).where("product_id = ?", params[:product_id])
  end
  def update_batches1
    render json: @batches1 = @batches = Batch.select(:rkbatchpacking,:rkbatchexpiry,:rkbatchpurchaserate).where("rkbatchno = ?", params[:batch_id])
  end

  # PATCH/PUT /productpurchasevats/1
  # PATCH/PUT /productpurchasevats/1.json
  def update
    byebug
    respond_to do |format|
      if @productpurchasevat.update(productpurchasevat_params)
        format.html { redirect_to @productpurchasevat, notice: 'Productpurchasevat was successfully updated.' }
        format.json { render :show, status: :ok, location: @productpurchasevat }
      else
        format.html { render :edit }
        format.json { render json: @productpurchasevat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productpurchasevats/1
  # DELETE /productpurchasevats/1.json
  def destroy
    byebug
    @productpurchasevat.destroy
    respond_to do |format|
      format.html { redirect_to productpurchasevats_url, notice: 'Productpurchasevat was successfully destroyed.' }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productpurchasevat
      @productpurchasevat = Productpurchasevat.find(params[:id])
      @products = Product.select(:id,:rkproductname)
      @batches = Batch.select(:rkbatchno).where("product_id = ?")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productpurchasevat_params
      params.require(:productpurchasevat).permit(
        :id,:chartaccount_id, :supplier_id, :employee_id, :rkpurchaseinvoiceno, :rkpurchasedate, :rkpurchaseduedate, :rktransportname, :rkpurchasegrno, :rkgoodsreceived, :rkpurchasenocase, :rkpurchaseccpercent, :rkpurchasesubtotal,:rkpurchasetotalcc, :rkpurchaseccadded, :rkpurchasediscount, :rkpurchaseshipping, :rkpurchasegrandtotal, :rkpurchaseinwords, :rkpurchaseunittotal, :rkpurchasevatpercent,purchproditemvats_attributes: Purchproditemvat.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
