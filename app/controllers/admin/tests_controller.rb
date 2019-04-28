class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!, except: :index
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show start update destroy edit update_inline]

  def index
  end

  def new
    @test = Test.new
  end
  
  def create
    test = current_user.created_tests.new(test_param)
    test.author_id = current_user.id
    if test.save
      redirect_to admin_tests_path, notice: t('.success_create')
    else
      render plain: t('.error')
    end
  end

  def edit  
  end

  def update 
    if @test.update(test_param)
      redirect_to admin_tests_path, notice: t('.success_update')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_param)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success_destroy')
  end

  def show
    @questions = @test.questions
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_param
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_tests
    @tests = Test.all
  end
end
