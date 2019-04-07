class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!, except: :index
  before_action :find_test, only: %i[show start update destroy edit]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end
  
  def create
    test = current_user.created_tests.new(test_param)
    test.author_id = current_user.id
    if test.save
      redirect_to admin_tests_path
    else
      render plain: "Save error!"
    end
  end

  def edit  
  end

  def update 
    if @test.update(test_param)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
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
end
