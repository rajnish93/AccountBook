class ProductcategoriesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_productcategory, only: [:show, :edit, :update, :destroy]

  # GET /productcategories
  # GET /productcategories.json
  def index
    @productcategories = Productcategory.all
    authorize @productcategories
  end

  # GET /productcategories/1
  # GET /productcategories/1.json
  def show
  end

  # GET /productcategories/new
  def new
    @productcategory = Productcategory.new
    authorize @productcategory
  end

  # GET /productcategories/1/edit
  def edit
  end

  # POST /productcategories
  # POST /productcategories.json
  def create
    @productcategory = Productcategory.new(productcategory_params)
    authorize @productcategory

    respond_to do |format|
      if @productcategory.save
        format.html { redirect_to productcategories_path, notice: 'Productcategory was successfully created.' }
        format.json { render :show, status: :created, location: @productcategory }
      else
        format.html { render :new }
        format.json { render json: @productcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productcategories/1
  # PATCH/PUT /productcategories/1.json
  def update
    respond_to do |format|
      if @productcategory.update(productcategory_params)
        authorize @productcategory
        format.html { redirect_to productcategories_path, notice: 'Productcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @productcategory }
      else
        format.html { render :edit }
        format.json { render json: @productcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productcategories/1
  # DELETE /productcategories/1.json
  def destroy
    @productcategory.destroy
    authorize @productcategory
    respond_to do |format|
      format.html { redirect_to productcategories_url, notice: 'Productcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productcategory
      @productcategory = Productcategory.find(params[:id])
      authorize @productcategory
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productcategory_params
      params.require(:productcategory).permit(:rkproductcategorycode, :rkproductcategoryname, :chartaccount_id)
    end
end
