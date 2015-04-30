FactoryGirl.define do
  factory :item do
    title 'New unique task'
    user
    completed false
    score 1.0
  end
end