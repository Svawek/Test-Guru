class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    @questions = Question.where(test_id: @test.id)
  end

  def show

  end

  def new

  end

  def create
    if question_param[:body].empty?
      render plain: "Question field is empty!"
    else
      question = @test.questions.create(question_param)
      redirect_to test_questions_path(question.test_id)
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
