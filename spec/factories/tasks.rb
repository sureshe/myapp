# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    task_name "taskname"
    task_description "tdescription"
    start_date '2014-08-02'
    end_date '2014-08-02'
  end
end
