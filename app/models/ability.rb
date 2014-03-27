class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, :all
    if user #&& user.admin?
      can :access, :rails_admin
      can :dashboard
      if user.is? :admin
        can :manage, :all
        cannot :destroy, Option
      end
      if user.is? :examiner
        can :manage, [Examination]
        can :manage, [Download]
        can :update, Pilot
        can :show_in_app, Pilot
        can :history, :all
        cannot :read, Option
        # can :update, User, :id => user.id
      end
      if user.is? :instructor
        can :manage, [Training]
        can :manage, [Download]
        can :update, Pilot
        can :show_in_app, Pilot
        can :history, :all
        cannot :read, Option
        # can :update, User, :id => user.id
      end
    end
  end
end