class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # user.admin? ? scope.all : scope.where(user: user)
      scope.all
    end
  end

  class ScopeList < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def list?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def owner_requests_list?
    true
  end
end
