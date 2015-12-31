class SynergyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def update?
    @user.admin? or @user == @record.user
  end
  def destroy?
    @user.admin? or @user == @record.user
  end
end
