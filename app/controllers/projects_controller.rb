class ProjectsController < ApplicationController
  def index
    puts "/////// entered into the index action /////"
    @project = Project.all
    puts "/////before/////"
    puts @project.inspect
    puts "////after////"
    puts "///// rendering to the testcase again ///"
    render json: @project
  end

  def new
    @project = Project.new
  end

  def create
    puts "//// Entered into create action //"
    @project = Project.create!(project_params)
    puts "//// inspecting create action ////"
    puts @project.inspect
    
    # @result = Hash.new
    # @project = Project.first
    # puts  "///////////////// Hash //////////////////////"
    # puts @project.inspect
    # @result['id'] = @project.id
    # @result['description'] = @project.description
    # @result['prerequisites'] = @project.prerequisites
    # @result['outcome'] = @project.outcome

    
    render status: 200, :json => @project, :except => [:created_at, :updated_at]
    # render status: 200, json: @result
      rescue ActiveRecord::RecordInvalid => exception
      render json: exception.record.errors
  end

  def update
    puts "//////// entered into the update method ///////"
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    puts "//////// updation in controller /////////"
    puts @project.inspect
    render json: @project, :except => [:created_at, :updated_at]
    rescue ActiveRecord::RecordInvalid => exception
      render json: exception.record.errors
  end

  def destroy
    puts "/////// entered into the destroy action ///////"
    @project = Project.find(params[:id])
    puts "************ Before destroying record ********"
    puts @project.inspect
    destroy = @project.destroy
    puts "************* After destroying record ********"
    puts destroy.inspect
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
