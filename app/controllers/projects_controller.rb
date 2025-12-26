class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [ :show, :edit, :archive ]
  before_action :authorize_project, only: [ :show, :edit, :archive ]

  def index
    @projects = policy_scope(Project).where(archived: false).order(created_at: :desc)
  end

  def show
    @total_tasks = @project.tasks.count
    @completed_tasks = @project.tasks.done.count
    @overdue_tasks = @project.tasks
                            .where("deadline < ?", Date.current)
                            .not_done
                            .count
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    authorize @project
    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def archive
    @project.update(archived: true)
    redirect_to projects_path, notice: "Project was successfully archived."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def authorize_project
    authorize @project
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
