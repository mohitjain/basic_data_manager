# All back end users (i.e. Active Admin users) are authorized using this class
class ActiveAdminAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # We operate with four role levels:
    if user.role == "normal_user"
      can :manage, :all
    else
      can :manage, :all
    end
  end
end

