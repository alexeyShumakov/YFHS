class SynergiesCardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
    @user.admin? or @record.synergy.user == @user
  end

  def destroy?
    @user.admin? or @record.synergy.user == @user
  end

  def update?
    @user.admin? or @record.synergy.user == @user
  end
end
