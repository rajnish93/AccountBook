class CompaniesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  #skip_after_action :verify_policy_scoped, only: [:index, :new, :create, :edit, :update, :destroy]
  # GET /companys
  # GET /companys.json
  #skip_after_action :set_company_as_tenant
  skip_before_action :company_set
  skip_before_action :set_company_as_tenant
  #skip_after_action :set_company_as_tenant
  layout "companyselect"
  def index
  #  render :layout => false
  #  @companies = policy_scope(Company)
    @companies = Company.all
    authorize @companies
  #  @companies = Company.find(params[:id])

  end

  # GET /companys/1
  # GET /companys/1.json
  def show
  end

  # GET /companys/new
  def new
    @company = Company.new
    authorize @company

  end

  # GET /companys/1/edit
  def edit
  end

  # POST /companys
  # POST /companys.json
  def create
    @company = Company.new(company_params)
    authorize @company

    respond_to do |format|
      if @company.save
        session[:company_id] = @company.id
        set_current_tenant(@company)
        format.html{redirect_to dashboard_index_path, notice: "Company Selected"}
        #format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        #format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companys/1
  # PATCH/PUT /companys/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        authorize @company

        format.html { redirect_to companies_path, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companys/1
  # DELETE /companys/1.json
  def destroy
    @company.destroy
    authorize @company

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
      authorize @company

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name)
    end
end
