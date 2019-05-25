class ErrorController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :set_company_as_tenant
  layout false
  def index
  end
end
