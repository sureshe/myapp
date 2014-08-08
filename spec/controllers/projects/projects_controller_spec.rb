require 'spec_helper'
require 'rails_helper'

RSpec.describe ProjectsController, :type => :controller do

#Use let blocks instead of before(:each) blocks to create data for the spec examples. let blocks get lazily evaluated.
#Use Factory Girl to create test objects

 let(:project) { FactoryGirl.create(:project) }
  subject { response }

    describe "GET # index" do
      context 'should able to show all the projects' do
        before do 
          project
          get :index
        end

      it { expect(response.body).to eq(
        [
          {
          id: project.id,
          description: project.description,
          prerequisites: project.prerequisites,
          outcome: project.outcome,
          created_at: project.created_at,
          updated_at: project.updated_at
          }
        ].to_json
      ) }
    end
  end

  describe "POST # create" do
    context 'should able to show all the project' do
      
      before do
        post :create, projects:{
          description: 'Mydesc',
          prerequisites: 'Mypr',
          outcome: 'Myotc'
        }
      end

      it { expect(response.body).to eq(
        {
          id: Project.all.first.id,
          description: Project.all.first.description,
          prerequisites: Project.all.first.prerequisites,
          outcome: Project.all.first.outcome,
        }.to_json
      ) }
    end
  end

  describe "PUT # update" do
    context 'should be able to update a project' do
      before do
        project
        delete :destroy, id: project.id
        expect = expect(response.body)
      end

      it{
          expect(response.status).to eq(204)
          expect(Project.all.count).to eq(0)
        }
    end
  end

  describe "DELETE # destroy" do
    context 'should be able to destroy a project' do
      before do
        project
        delete :destroy, id: project.id
        expect = expect(response.body)
      end

      it{
          expect(response.status).to eq(204)
          expect(Project.all.count).to eq(0)
        }
    end
  end

  describe "GET # show" do
    context 'should be able to destroy a project' do
      before do
        project
        get :show, id: project.id
      end

    # expect(response.status).to eq(200)
      it { expect(response.body).to eq(
          {
          id: project.id,
          description: project.description,
          prerequisites: project.prerequisites,
          outcome: project.outcome,
          created_at: project.created_at,
          updated_at: project.updated_at
          }.to_json
      ) }
        
    end
  end
end
