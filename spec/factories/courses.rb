# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "pedagogy"

    factory :invalid_course do
    	name nil
    end
  end
end
