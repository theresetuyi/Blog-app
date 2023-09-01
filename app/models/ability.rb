class Ability
  include CanCanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        can :destroy, Post, user_id: user.id
        can :destroy, Comment, user_id: user.id
      end
    else
      can :read, :all
    end
  end
end