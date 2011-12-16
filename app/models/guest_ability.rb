class GuestAbility
  include CanCan::Ability

  def initialize
    can :read, :all
    can :update_likes, Idea
  end
end
