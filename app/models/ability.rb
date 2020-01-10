class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    if user.present?
      can [:create, :update, :destroy], Post, user_id: user.id
    end
  end
end
