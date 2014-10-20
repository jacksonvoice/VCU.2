# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :section do
    name "exercises"
    course_id 1

    factory :invalid_section do
    	name nil
    	course_id nil
    end
  end
end
