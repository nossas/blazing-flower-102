class MemberAbility
  include CanCan::Ability

  def initialize(member)
    can :read, :all
    can :create, Idea
    can :manage, Idea do |idea| idea.member == member end
  end
end
