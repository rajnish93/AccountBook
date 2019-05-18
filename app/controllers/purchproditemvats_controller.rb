class PurchproditemvatsController < ApplicationController
  before_action :set_purchproditemvat, only: [:show, :edit, :update, :destroy]

  # GET /purchproditemvats
  # GET /purchproditemvats.json
  def index
    @purchproditemvats = Purchproditemvat.all
  end

  # GET /purchproditemvats/1
  # GET /purchproditemvats/1.json
  def show
  end

  # GET /purchproditemvats/new
  def new
    @purchproditemvat = Purchproditemvat.new
    #@products = Product.select(:id,:rkproductname)
  end

  # GET /purchproditemvats/1/edit
  def edit
  end

  # POST /purchproditemvats
  # POST /purchproditemvats.json
  def create
    @purchproditemvat = Purchproditemvat.new(purchproditemvat_params)
    #@products = Product.select(:id,:rkproductname)
    respond_to do |format|
      if @purchproditemvat.save
        format.html { redirect_to @purchproditemvat, notice: 'Purchproditemvat was successfully created.' }
        format.json { render :show, status: :created, location: @purchproditemvat }
      else
        format.html { render :new }
        format.json { render json: @purchproditemvat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchproditemvats/1
  # PATCH/PUT /purchproditemvats/1.json
  def update
    respond_to do |format|
      if @purchproditemvat.update(purchproditemvat_params)
        format.html { redirect_to @purchproditemvat, notice: 'Purchproditemvat was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchproditemvat }
      else
        format.html { render :edit }
        format.json { render json: @purchproditemvat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchproditemvats/1
  # DELETE /purchproditemvats/1.json
  def destroy
    @purchproditemvat.destroy
    respond_to do |format|
      format.html { redirect_to purchproditemvats_url, notice: 'Purchproditemvat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchproditemvat
      @purchproditemvat = Purchproditemvat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchproditemvat_params
      params.require(:purchproditemvat).permit(:productpurchasevat_id, :product_id, :batch_id, :rkpurchproduom, :rkpurchprodexp, :rkpurchprodqty, :rkpurchprodfree, :rkpurchprodrate, :rkpurchprodsubval, :rkpurchprodamount)
    end
end
