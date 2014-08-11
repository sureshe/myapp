require 'rails_helper'

RSpec.describe TasksController, :type => :controller do
 let(:task) { FactoryGirl.create(:task) }
  subject { response }

  describe "GET # index" do
    context 'should able to show all the tasks' do
      before do
        task
        get :index, {project_id: task.id}
      end
      it {
          expect(response.body).to eq(
            [
              {
              id: task.id,
              task_name: task.task_name,
              task_description: task.task_description
              }
              ].to_json
          )
         }
      end
    end

  describe "POST # create" do
    context 'should able to create task' do
      
      before do
        post :create, project_id: task.id,  tasks:{
          task_name: 'taskname',
          task_description: 'tdescription',
          start_date: '2014-08-02',
          end_date: '2014-08-02'
        }
      end

      it { expect(response.body).to eq(
          {
          id: Task.all.second.id,
          task_name: Task.all.second.task_name,
          task_description: Task.all.second.task_description,
          start_date: Task.all.second.start_date,
          end_date: Task.all.second.end_date
        }.to_json
      ) }
    end
  end

  describe "PUT # update" do
    context 'should be able to update a task' do

      before do
        task
        put :update, project_id: task.id, tasks: {
          task_description: "descp" 
          }, id: task.id

        task.reload
      end
      it { 
          expect(response.body).to eq(
            {
              id: task.id,
              task_name: task.task_name,
              task_description: task.task_description,
              start_date: task.start_date,
              end_date: task.end_date
            }.to_json
          ) 
          expect(task.task_description).to eq("descp")
         }
    end
  end

  describe "GET # show" do
    context 'should be able to destroy a task' do
      before do
        task
        get :show, project_id: task.id, tasks: {
          task_description: "descp" 
          }, id: task.id
      end

      it { 
          expect(response.body).to eq({
            id: task.id,
            task_name: task.task_name,
            task_description: task.task_description,
            start_date: task.start_date,
            end_date: task.end_date
            }.to_json
          )
         }
    end
  end

  describe "DELETE # destroy" do
    context 'should be able to destroy a task' do
      before do
        task
        delete :destroy, project_id: task.id, tasks: {
          task_description: "descp" 
          }, id: task.id
      end

      it{
          expect(response.status).to eq(204)
          expect(Task.all.count).to eq(0)
        }
    end
  end
end
