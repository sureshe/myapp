class ProjectsController < ApplicationController
  def index
    @project = Project.all
    render json: @project
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create!(project_params)
    render status: 200, :json => @project, :except => [:created_at, :updated_at]
    rescue ActiveRecord::RecordInvalid => exception
    render json: exception.record.errors
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    render json: @project, :except => [:created_at, :updated_at]
    rescue ActiveRecord::RecordInvalid => exception
    render json: exception.record.errors
  end

  def destroy
    @project = Project.find(params[:id])
    destroy = @project.destroy
    render status: 204, json: nil
    rescue ActiveRecord::RecordInvalid => exception
      render json: exception.record.errors
  end

  def show
    @project = Project.find(params[:id])
    render json:@project
  end

  private 

  def project_params
    params.require(:projects).permit(:description, :prerequisites, :outcome)
  end
end
