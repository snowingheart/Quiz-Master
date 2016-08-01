require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe "GET #index" do
    it "fetches all available questions" do
      question = FactoryGirl.create(:question)
      get :index
      expect(assigns(:questions)).to eq([question])
    end
    it "renders the view with the list of questions" do
      get :index
      expect(response).to render_template :index
    end

  end
  
  describe "GET #show" do
    it "fetches the question with the given id" do
      question = FactoryGirl.create(:question)
      get :show, id: question
      expect(assigns(:question)).to eq(question)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:question)
      expect(response).to render_template :show
    end

  end

  describe "GET #answer" do
    it "fetches the question with the given id" do
      question = FactoryGirl.create(:question)
      get :answer, id: question
      expect(assigns(:question)).to eq(question)
    end
    it "renders the :answer template" do
      get :answer, id: FactoryGirl.create(:question)
      expect(response).to render_template :answer
    end
  end

  describe "POST #validate" do
    it "fetches the question with the given id" do
      question = FactoryGirl.create(:question)
      get :validate, id: question, proposed_answer: "some_answer"
      expect(assigns(:question)).to eq(question)
    end
    it "extracts the proposed answer from the parameters array" do
      question = FactoryGirl.create(:question)
      post :validate, id: question, proposed_answer: "some answer"
      expect(assigns(:pa)).to eq("some answer")
    end
    it "stores whether the answer was right or not in @is_correct" do
      question = FactoryGirl.create(:question)
      post :validate, id: question, proposed_answer: question.answer
      expect(assigns(:is_correct)).to be_truthy
    end
    it "renders the :validate template" do
      question = FactoryGirl.create(:question)
      post :validate, id: question, proposed_answer: question.answer
      expect(response).to render_template :validate
    end
  end

end
