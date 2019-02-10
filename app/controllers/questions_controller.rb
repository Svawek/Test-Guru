class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  
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
    @question.destroy
  end

  private
  attr_reader :test_id

  def find_test
    @test_id = params["test_id"].to_i
  end

  def question_param
    params.require(:question).permit(:body)
  end
end
