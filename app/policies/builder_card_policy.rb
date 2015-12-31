class BuilderCardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def save?
    @user.admin? or @record.deck.user == @user
  end

  def destroy?
    @user.admin? or @record.deck.user == @user
  end

  def update?
    @user.admin? or @record.deck.user == @user
  end
end
