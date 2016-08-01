# spec/factories/questions.rb
FactoryGirl.define do
  factory :question do |f|
    f.query "Guess a number betweek 1 and 100"
    f.answer { Faker::Number.between(1,100) }
  end

  factory :invalid_question, parent: :question do |f|
    f.query nil
  end

end
