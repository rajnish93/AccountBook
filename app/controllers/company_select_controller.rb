class CompanySelectController < ApplicationController
  before_action :authenticate_user!
  #after_action :verify_authorized
  #after_action :verify_authorized
  #skip_after_action :set_company_as_tenant, only: [:create, :index]
  skip_before_action :company_set
  skip_before_action :set_company_as_tenant
  #skip_after_action :set_company_as_tenant
  #layout false

  layout "companyselect"
  def index

    #@select = Company.all
    #@select = Company.find(current_user.company_id)
    @select = Company.all.where(:id => current_user.company_id).map{|u| [ u.name, u.id ]}
  #  @select = Company.find(current_user.company_id)#Company.joins(:users)
    #authorize @select

  end
  def create
    company = Company.find(params[:id])
    #authorize company
    session[:company_id] = company.id
    set_current_tenant(company)
    redirect_to dashboard_index_path, notice: "Company Selected"
  end


end
