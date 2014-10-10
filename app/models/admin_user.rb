class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  ROLES = ["normal_user", "super_user"]
  delegate :can?, :cannot?, :to => :ability

  def ability
    @ability ||= ActiveAdminAbility.new(self)
  end


  def role?(base_role)
    return false unless clearance_level # A user have a role attribute. If not set, the user does not have any roles.
    ROLES.index(base_role.to_s) <= ROLES.index(clearance_level)
  end


  ROLES.each do |role_type|
    define_method "#{role_type}?" do
      self.role == role_type
    end
  end

end
