class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= AdminUser.new
    if user.admin?
      can :manage, :all
    else
      can :read, :petitions
    end

  end
end
