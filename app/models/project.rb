class Project < ActiveRecord::Base

  # include ActiveModel::ForbiddenAttributesProtection

  has_many :tasks

  validates :description, :presence => true
  validates :prerequisites, :presence => true
  validates :outcome, :presence => true

  # def project_params
  #     params.require(:project).permit(:description, :prerequisites, :outcome)
  # end
end
