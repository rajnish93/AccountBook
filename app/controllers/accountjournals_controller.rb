class AccountjournalsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_accountjournal, only: [:show, :edit, :update, :destroy]

  # GET /accountjournals
  # GET /accountjournals.json
  def index
    @accountjournals = Accountjournal.all
    authorize @accountjournals
  end

  # GET /accountjournals/1
  # GET /accountjournals/1.json
  def show
  end

  # GET /accountjournals/new
  def new
    @accountjournal = Accountjournal.new
    authorize @accountjournal
  end

  # GET /accountjournals/1/edit
  def edit
  end

  # POST /accountjournals
  # POST /accountjournals.json
  def create
    @accountjournal = Accountjournal.new(accountjournal_params)
    authorize @accountjournal
    respond_to do |format|
      if @accountjournal.save
        format.html { redirect_to accountjournals_path, notice: 'Accountjournal was successfully created.' }
        format.json { render :show, status: :created, location: @accountjournal }
      else
        format.html { render :new }
        format.json { render json: @accountjournal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountjournals/1
  # PATCH/PUT /accountjournals/1.json
  def update
    respond_to do |format|
      if @accountjournal.update(accountjournal_params)
        authorize @accountjournal
        format.html { redirect_to accountjournals_path, notice: 'Accountjournal was successfully updated.' }
        format.json { render :show, status: :ok, location: @accountjournal }
      else
        format.html { render :edit }
        format.json { render json: @accountjournal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountjournals/1
  # DELETE /accountjournals/1.json
  def destroy
    @accountjournal.destroy
    authorize @accountjournal
    respond_to do |format|
      format.html { redirect_to accountjournals_url, notice: 'Accountjournal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accountjournal
      @accountjournal = Accountjournal.find(params[:id])
      authorize @accountjournal
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accountjournal_params
      params.require(:accountjournal).permit(:rkvouchercode, :chartaccount_id, :sale, :rkvoucheramount, :rkvoucherdescription, :text, :rkvoucherdate)
    end
end
