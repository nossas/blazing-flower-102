class MemberAbility
  include CanCan::Ability

  def initialize(member)
    can :read, :all
    can :update_likes, Idea
    can [:create, :create_fork, :merge], Idea
    can :manage, Idea do |idea| idea.member == member end
  end
end
