class AccountgroupsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  before_action :set_accountgroup, only: [:show, :edit, :update, :destroy]

  # GET /accountgroups
  # GET /accountgroups.json
  def index
    @accountgroups = Accountgroup.all.page(params[:page]).per(5)
    authorize @accountgroups
  end

  # GET /accountgroups/1
  # GET /accountgroups/1.json
  def show
  end

  # GET /accountgroups/new
  def new
    @accountgroup = Accountgroup.new
    authorize @accountgroup
  end

  # GET /accountgroups/1/edit
  def edit
  end

  # POST /accountgroups
  # POST /accountgroups.json
  def create
    @accountgroup = Accountgroup.new(accountgroup_params)
    authorize @accountgroup
    respond_to do |format|
      if @accountgroup.save
        format.html { redirect_to accountgroups_path, notice: 'Accountgroup was successfully created.' }
        format.json { render :show, status: :created, location: @accountgroup }
      else
        format.html { render :new }
        format.json { render json: @accountgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountgroups/1
  # PATCH/PUT /accountgroups/1.json
  def update
    respond_to do |format|
      if @accountgroup.update(accountgroup_params)
        authorize @accountgroup
        format.html { redirect_to accountgroups_path, notice: 'Accountgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @accountgroup }
      else
        format.html { render :edit }
        format.json { render json: @accountgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountgroups/1
  # DELETE /accountgroups/1.json
  def destroy
    @accountgroup.destroy
    authorize @accountgroup
    respond_to do |format|
      format.html { redirect_to accountgroups_url, notice: 'Accountgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accountgroup
      @accountgroup = Accountgroup.find(params[:id])
      authorize @accountgroup
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accountgroup_params
      params.require(:accountgroup).permit(:rkaccountcode, :rkaccountname, :rkaccounttype)
    end
end
