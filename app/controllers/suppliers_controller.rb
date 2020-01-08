class SuppliersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all
    @suppliers = Supplier.includes(:chartaccount)
    authorize @suppliers
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
    authorize @supplier
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
    authorize @supplier

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to suppliers_path, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        authorize @supplier
        format.html { redirect_to suppliers_path, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    authorize @supplier
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
      authorize @supplier
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:rksupplierstatus, :rksuppliername, :rksuppliertin, :rksupplierpan, :rksuppliergstn, :rksupplierddalic, :rksupplierphone, :rksupplieraddress, :rksuppliercity, :rksupplierzone, :rksupplierstate, :rksupplierzipcode, :rksuppliercountry, :chartaccount_id)
    end
end
