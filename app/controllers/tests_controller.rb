class TestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_test, only: %i[show start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end
