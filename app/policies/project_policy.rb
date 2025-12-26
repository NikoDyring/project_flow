class ProjectPolicy < ApplicationPolicy
  def show?
    user.admin? ||
      project.owner == user ||
      project.tasks.exists?(assignee_id: user.id)
  end

  def create?
    user.manager? || user.admin?
  end

  def update?
    user.admin? || project.owner == user
  end

  def archive?
    update?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.manager?
        scope.where(owner: user)
      else
        scope.where(owner: user)
             .or(scope.joins(:tasks).where(tasks: { assignee_id: user.id }).distinct)
      end
    end
  end
end
