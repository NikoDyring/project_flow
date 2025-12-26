class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @projects = policy_scope(Project).where(archived: false).order(created_at: :desc)
  end
end
