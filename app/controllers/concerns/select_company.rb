# module SelectCompany
#   private
#     def company_set
#       @set_company = Company.find(session[:company_id])
#     rescue ActiveRecord::RecordNotFound
#       redirect_to company_select_index_path
#
#     end
# end
