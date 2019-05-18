class ProductpurchasegstsController < ApplicationController
  before_action :authenticate_user!
  #after_action :verify_authorized


  before_action :set_productpurchasegst, only: [:show, :edit, :update, :destroy]


  # GET /productpurchasegsts
  # GET /productpurchasegsts.json
  def index
    @productpurchasegsts = Productpurchasegst.all
    @productpurchasegsts = Productpurchasegst.includes(:chartaccount, :supplier, :employee)
  end

  # GET /productpurchasegsts/1
  # GET /productpurchasegsts/1.json
  def show
  end

  # GET /productpurchasegsts/new
  def new
    byebug
    @productpurchasegst = Productpurchasegst.new
  end

  # GET /productpurchasegsts/1/edit
  def edit
  end

  # POST /productpurchasegsts
  # POST /productpurchasegsts.json
  def create
    byebug
    @productpurchasegst = Productpurchasegst.new(productpurchasegst_params)

    respond_to do |format|
      if @productpurchasegst.save
        format.html { redirect_to @productpurchasegst, notice: 'Productpurchasegst was successfully created.' }
        format.json { render :show, status: :created, location: @productpurchasegst }
      else
        format.html { render :new }
        format.json { render json: @productpurchasegst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productpurchasegsts/1
  # PATCH/PUT /productpurchasegsts/1.json
  def update
    byebug
    respond_to do |format|
      if @productpurchasegst.update(productpurchasegst_params)
        format.html { redirect_to @productpurchasegst, notice: 'Productpurchasegst was successfully updated.' }
        format.json { render :show, status: :ok, location: @productpurchasegst }
      else
        format.html { render :edit }
        format.json { render json: @productpurchasegst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productpurchasegsts/1
  # DELETE /productpurchasegsts/1.json
  def destroy
    byebug
    @productpurchasegst.destroy
    respond_to do |format|
      format.html { redirect_to productpurchasegsts_url, notice: 'Productpurchasegst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productpurchasegst
      @productpurchasegst = Productpurchasegst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productpurchasegst_params
      params.require(:productpurchasegst).permit(
        :id,:chartaccount_id, :supplier_id, :employee_id, :rkpurchaseinvoiceno, :rkpurchasedate, :rkpurchaseduedate, :rktransportname, :rkpurchasegrno, :rkgoodsreceived, :rkpurchasenocase, :rkpurchasesubtotal, :rkpurchasetotaligst, :rkpurchasetotalcgst, :rkpurchasetotalsgst, :rkpurchasediscount, :rkpurchaseshipping, :rkpurchasegrandtotal, :rkpurchaseinwords, :rkpurchaseunittotal,purchproditemgsts_attributes: Purchproditemgst.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
