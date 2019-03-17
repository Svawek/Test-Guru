class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
