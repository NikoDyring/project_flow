class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    # TODO: Load stats later
  end
end
