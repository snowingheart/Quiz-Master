# spec/models/question.rb
require 'rails_helper'

describe Question do

  it "has a valid factory" do
    expect(FactoryGirl.create(:question)).to be_valid
  end

  it "is invalid without a query" do
    expect(FactoryGirl.build(:question, query: nil)).to be_invalid
  end

  it "is invalid without an answer" do
    expect(FactoryGirl.build(:question, answer: nil)).to be_invalid
  end

  it "checks if a given answer is correct" do
    q = FactoryGirl.create(:question)
    expect(q.correct_answer(q.answer)).to be_truthy
  end

  it "checks for numbers as words in English for correct answers" do
    q = FactoryGirl.create(:question, answer: 5)
    expect(q.correct_answer("five")).to be_truthy
  end

end
