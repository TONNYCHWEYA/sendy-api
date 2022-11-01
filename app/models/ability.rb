class Ability
  include CanCan::Ability

  def initialize(user)
    # a user can
    user ||= User.new
    can :create, :read, :destroy

    # if a user is logged in
    if user.present?
      if user.isAdmin?
        # admin priviledges
        can :manage, :parcels_controller
        can :manage, :all
      else
        # normal users have the following rights
        can :read, :parcels_controller, hidden: true
      end
    else
      # user not loggedin(present) should only see the sign up page
      can :read, :sign_up
    end
  end
end
