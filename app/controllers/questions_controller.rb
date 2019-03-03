class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    @questions = @test.questions
  end

  def show

  end

  def new

  end

  def create
    question = @test.questions.new(question_param)
    if question.save
      redirect_to test_questions_path(question.test_id)
    else
      render plain: "Save error!"
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test_id)
  end

  private
  attr_reader :test, :question

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_param
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
