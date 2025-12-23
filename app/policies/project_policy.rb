class ProjectPolicy < ApplicationPolicy
  def create?
    user.manager? || user.admin?
  end

  def update?
    user.admin? || (user.manager? && record.owner == user)
  end

  def destroy?
  user.admin? || record.owner == user
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(owner: user).or(scope.joins(:tasks).where(tasks: { assignee_id: user.id })).distinct
      end
  end
end
