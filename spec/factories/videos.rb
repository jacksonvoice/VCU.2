# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    name "learning"
    section_id 1

    factory :invalid_video do
    	name nil
    	section_id nil
    end
  end
end
