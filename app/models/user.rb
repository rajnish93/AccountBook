class User < ApplicationRecord
  #attr_accessible :user
  belongs_to :company

  # default => No Permission
  # user => View Permission
  # billing => create bills
  # accounteditor => Edit and create only accounting data
  # manager => edit only employee data
  # employee => view, create, only own data
  # admin => all Permission

  enum role: [:default, :user, :billing, :accounteditor, :manager, :employee, :admin]
  after_initialize :set_default_role,  :if => :new_record?
#:set_default_company,
  def set_default_role
    if User.count==0
      self.role ||=:admin

    else

      self.role ||= :default
      
    end
  end

  # def set_default_company
  #   if self.company_id.nil?
  #     companies_path
  #   else
  #
  #     dashboard_path
  #   end
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
