class TasksController < ApplicationController
  def index
    @task = Task.all
    puts @task.inspect
    render json: @task, :except => [:created_at, :updated_at, :start_date, :end_date]
  end

  def create
    @task = Task.create!(task_params)
    puts @task.inspect
    render status: 200, :json => @task, :except => [:created_at, :updated_at]
    rescue ActiveRecord::RecordInvalid => exception
    render json: exception.record.errors
  end

  def update
    @task = Task.find(params[:id])
    puts @task.inspect
    @task.update_attributes(task_params)
    render json: @task, :except => [:created_at, :updated_at]
    rescue ActiveRecord::RecordInvalid => exception
    render json: exception.record.errors
  end

  def destroy
    @task = Task.find(params[:id])
    destroy = @task.destroy
    render status: 204, json: nil
    rescue ActiveRecord::RecordInvalid => exception
      render json: exception.record.errors
  end

  def show
    @task = Task.find(params[:id])
    render json:@task, :except => [:created_at, :updated_at]
  end

  private

  def task_params
    params.require(:tasks).permit(:task_name, :task_description, :start_date, :end_date)
  end
end


