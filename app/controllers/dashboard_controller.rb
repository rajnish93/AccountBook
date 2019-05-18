class DashboardController < ApplicationController
  before_action :authenticate_user!
  #after_action :verify_authorized
  #skip_after_action :verify_policy_scoped, only: [:index]
  #skip_after_action :set_company_as_tenant
  #skip_before_action :set_company_as_tenant
  def index
    @users = User.all

  end
end
