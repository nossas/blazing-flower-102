class IdeaAbility
  include CanCan::Ability

  def initialize(member)
    member ||= Member.new
    can :read, :all
    can :explore, Idea

    if member
      can :create, Idea
      can :manage, User { |current| current.id == member.id }
      can :manage, Idea { |idea| idea.member_id == member.id }
      can :create_fork, Idea
      can :merge, Idea
    end
  end
end
