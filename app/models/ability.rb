class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, :all
    if user #&& user.admin?
      can :access, :rails_admin      
      can :dashboard  
      if user.is? :admin
        can :manage, :all
      end  
      if user.is? :examiner
        can :manage, [Examination] 
        can :manage, [Download] 
        can :update, Pilot
        can :show_in_app, Pilot
        can :history, :all
        can :update, User, :id => user.id
      end
      if user.is? :instructor
        can :manage, [Training]
        can :manage, [Download] 
        can :update, Pilot
        can :show_in_app, Pilot
        can :history, :all
        can :update, User, :id => user.id
      end
      
      # if user.role? :superadmin
      #   can :manage, :all             # allow superadmins to do anything
      # elsif user.role? :manager
      #   can :manage, [User, Product]  # allow managers to do anything to products and users
      # elsif user.role? :sales
      #   can :update, Product, :hidden => false  # allow sales to only update visible products
      # end
    end
  end
end