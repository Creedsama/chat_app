class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :mentor
      can [:create, :update, :destroy], [Conversation, Message]
      can :read, :all
    elsif user.has_role? :student
      can [:update, :destroy], [Conversation, Message]
      can :read, :all
    else
      can :read, :all
    end
  end
end
