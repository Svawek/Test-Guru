class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    @questions = Question.where(test_id: @test_id)
  end

  def show
    @question_id = params["id"].to_i
    @question = Question.find(@question_id)
  end

  def new

  end

  def create
    question = Question.new(question_param)
    question.test_id = @test_id
    question.save
  end

  def destroy
    Question.find(params[:id]).destroy

    redirect_to '/tests/1/questions'
  end

  private
  attr_reader :test_id

  def find_test
    @test_id = params["test_id"].to_i
  end

  def question_param
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
