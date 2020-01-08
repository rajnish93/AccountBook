class OrderPolicy < ApplicationPolicy
  def index?
    user.present? && user.accounteditor? || user.present? && user.billing? || user.present? && user.admin?
  end
  def show?
    user.present? && user.accounteditor? || user.present? && user.billing? || user.present? && user.admin?
  end

  def create?
    user.present? && user.accounteditor? || user.present? && user.billing? || user.present? && user.admin?
  end
  def edit?
    user.present? && user.accounteditor? || user.present? && user.admin?
  end
  def update?
    user.present? && user.accounteditor? || user.present? && user.admin?
  end
  def destroy?
    user.present? && user.admin?
  end
end
