class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  #skip_after_action :verify_policy_scoped, only: [:index, :new, :create, :edit, :update, :destroy]
  #skip_before_action :set_company_as_tenant, raise: false
  #skip_after_action :set_customer_as_tenant
  #skip_after_action :set_company_as_tenant
  skip_before_action :set_company_as_tenant
  def index
  #  @users = policy_scope(User)
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private



  def secure_params
    params.require(:user).permit(:role, :company_id)     #show category: Mass Assignment
  end

end
