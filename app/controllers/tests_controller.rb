class TestsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    if @test.questions.empty?
      redirect_to tests_path, alert: 'No questions in this test'
    else
      redirect_to current_user.test_passage(@test)
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
