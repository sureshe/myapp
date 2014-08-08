# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    description "Mydesc"
    prerequisites "Mypre"
    outcome "Myotc"
    created_at Date.yesterday
    updated_at Date.yesterday
  end
end


