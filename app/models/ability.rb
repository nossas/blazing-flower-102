class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= AdminUser.new
    if user.admin?
      can :manage, :all
    # elsif user.campaigner?
    #   can :manage, :petitions
    else
      can :read, :petitions
    end

  end
end
