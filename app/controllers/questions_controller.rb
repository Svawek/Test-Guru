class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def show
  end

  
  private
  attr_reader :test, :question

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
