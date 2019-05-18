class CompanySelectPolicy < ApplicationPolicy
  def index?
    user.present? && user.accounteditor? || user.present? && user.admin?
  end

  def create?
    user.present? && user.accounteditor? || user.present? && user.admin?
  end
  
end
