class DeckPolicy < ApplicationPolicy
  def update?
    @user.admin? or @user == @record.user
  end
  def destroy?
    @user.admin? or @user == @record.user
  end
end
